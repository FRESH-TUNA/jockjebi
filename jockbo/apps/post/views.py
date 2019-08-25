from rest_framework import status, viewsets
from rest_framework.response import Response
from jockbo.apps.common.models import Post, University, BookMark
from jockbo.apps.common.permissions import IsOwnerOrReadOnly
from .serializers import *
from django.db.models import Avg, Count, Func
from django.db.models.functions import Coalesce

import logging

class Round(Func):
    function = "ROUND"
    template = "%(function)s(%(expressions)s::numeric, 1)"

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = (IsOwnerOrReadOnly,)
    lookup_field = 'postPk'
    
    def makeListQueryset(self, request):
        queryset = Post.objects.all()

        university = request.GET.get('university', False)
        professorName = request.GET.get('professorName', False)
        semester = request.GET.getlist('semester', False)
        subject = request.GET.get('subject', False)
        bookmark = request.GET.get('bookmark', False)
        haveAnswer = request.GET.get('haveAnswer', False)
        sort = request.GET.get('sort', False)

        if university is not False:
            try:
                queryset = queryset.filter(university=University.objects.get(title__contains=university))
            except:
                return None
            
        if professorName is not False:
            queryset = queryset.filter(professor=professorName)
        if semester is not False:
            queryset = queryset.filter(semester__in=semester)
        if subject is not False:
            queryset = queryset.filter(subject__contains=subject)
        if bookmark is not False and request.user.is_authenticated:
            queryset = queryset.filter(id__in=[bookmark.post.id for bookmark in BookMark.objects.all().filter(user=request.user)])
        if haveAnswer is not False:
            queryset = queryset.filter(haveAnswer=True)
        
        queryset = queryset.annotate(
            star=Coalesce(Round(Avg('comments__star')), 0.0))
        
        if sort is False or sort == 'recently': 
            queryset = queryset.order_by('-year')
        else: 
            queryset = queryset.order_by('-star') #차후에 구현한다.
        return queryset

    def list(self, request):   
        serializer = PostListSerializer(self.makeListQueryset(request), many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

    def retrieve(self, request, postPk):
        post = Post.objects.get(id=postPk)
        isBookmarked = False   

        if request.user.is_authenticated:
            try:
                isBookmarked = BookMark.objects.get(user=request.user, post=Post.objects.get(id=postPk)) is not None
            except BookMark.DoesNotExist:
                pass

        serializer = PostSerializer(post, context={'request': request, 'isBookmarked': isBookmarked})
        return Response(serializer.data, status=status.HTTP_200_OK) 

    def update(self, request, postPk):
        post = None
        post=Post.objects.get(id=postPk)
        serializer = PostCreateSerializer(post, data=request.data, partial=True)
        # self.check_object_permissions(request, post)
        if serializer.is_valid():
            university = request.data.get('university', False)

            if university is not False:
                university, newUniversity = University.objects.get_or_create(title=university)
                if university == None:
                    serializer.save(university=newUniversity)
                else:
                    serializer.save(university=university)
            else:
                serializer.save()
            return Response(serializer.validated_data, status=status.HTTP_200_OK) 
        else:
            return Response({'update':'failed'}, status=status.HTTP_400_BAD_REQUEST) 


    def create(self, request):
        serializer = PostCreateSerializer(data=request.data)
        try:
            serializer.is_valid()
            university, newUniversity = University.objects.get_or_create(title=request.data['university'])
            if university == None:
                serializer.save(user=request.user, university=newUniversity)
            else:
                serializer.save(user=request.user, university=university)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def destroy(self, request, postPk):
        post = Post.objects.get(id=postPk) 
        self.check_object_permissions(request, post)
        post.delete()
        return Response({'post': 'deleted'}, status=status.HTTP_204_NO_CONTENT) 

#SQL QUERY
            # queryset = Post.objects.raw(
            #     '''
            #     SELECT * FROM api_post 
            #     WHERE id IN (SELECT post_id FROM api_bookmark WHERE user_id = {})
            #     '''
            #     .format(request.user.id)
            # )