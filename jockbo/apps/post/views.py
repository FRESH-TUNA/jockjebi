from rest_framework import status, viewsets
from rest_framework.response import Response
from jockbo.apps.common.models import Post, University, BookMark
from jockbo.apps.common.permissions import IsOwnerOrReadOnly
from .serializers import *
import logging

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = (IsOwnerOrReadOnly,)
    lookup_field = 'postPk'

    def list(self, request):
        queryset = Post.objects.all()

        fromYear = request.GET.get('fromYear', False)
        toYear = request.GET.get('toYear', False)
        category = request.GET.get('category', False)
        semester = request.GET.get('semester', False)
        subject = request.GET.get('subject', False)
        bookmark = request.GET.get('bookmark', False)
        semester = request.GET.get('semester', False)
        university = request.GET.get('university', False)

        if bookmark is not False and request.user.is_authenticated:
            postPkList = [bookmark.post.id for bookmark in BookMark.objects.all().filter(user=request.user)]
        if university is not False:
            queryset = queryset.filter(university=University.objects.get(title=university))
        if subject is not False:
            queryset = queryset.filter(subject__contains=subject)

        if fromYear is not False and toYear is not False:
            if fromYear == toYear:
                queryset = queryset.filter(year=fromYear)
            else:
                queryset = queryset.filter(year__in=range(fromYear, toYear+1))

        if category is not False:
            queryset = queryset.filter(category__contains=category)
        if semester is not False:
            queryset = queryset.filter(semester=semester)
            
            
            
            #SQL QUERY
            # queryset = Post.objects.raw(
            #     '''
            #     SELECT * FROM api_post 
            #     WHERE id IN (SELECT post_id FROM api_bookmark WHERE user_id = {})
            #     '''
            #     .format(request.user.id)
            # )
            queryset = queryset.filter(pk__in=postPkList)
        serializer = PostListSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

    def retrieve(self, request, postPk):
        post = Post.objects.get(id=postPk)
        isBookmarked = False   

        if request.user.is_authenticated:
            try:
                isBookmarked = BookMark.objects.get(user=request.user, post=Post.objects.get(id=postPk)) is not None
            except BookMark.DoesNotExist:
                pass

        serializer = PostSerializer(post, context={'isBookmarked': isBookmarked})
        return Response(serializer.data, status=status.HTTP_200_OK) 

    def partial_update(self, request, postPk):
        post = None
        serializer = PostSerializer(post, data=request.data)
        try:
            post=Post.objects.get(id=postPk)
            self.check_object_permissions(request, post)
            serializer.is_valid()
            serializer.save()
            return Response(serializer.validated_data, status=status.HTTP_200_OK) 
        except Post.DoesNotExist:
            return Response({'error': 'post is none'}, status=status.HTTP_400_BAD_REQUEST)      
        except:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)   

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
        post = None

        # if postPk is None:
        #     return Response({'error': 'poskPk is none'}, status=status.HTTP_400_BAD_REQUEST) 
        try:
            post=Post.objects.get(id=postPk)
            self.check_object_permissions(request, post)    #model level validation을 위해서 반드시필요 비인증시 401코드 반환
        except Post.DoesNotExist:
            return Response({'error': 'post is none'}, status=status.HTTP_400_BAD_REQUEST)      

        post.delete()
        return Response({'post': 'deleted'}, status=status.HTTP_204_NO_CONTENT) 
