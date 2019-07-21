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
        university = request.GET.get('university', False)
        subject = request.GET.get('subject', False)
        bookmark = request.GET.get('bookmark', False)

        if university is not False:
            university = University.objects.get(title=university)
            queryset = queryset.filter(university=university)
        if subject is not False:
            queryset = queryset.filter(subject__contains=subject)
        if bookmark is not False:
            queryset = Post.objects.raw(
              '''
              SELECT * FROM api_post 
              WHERE id IN (SELECT post_id FROM api_bookmark WHERE user_id = {})
              '''
              .format(request.user.id)
            )
        serializer = PostListSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

    def retrieve(self, request, postPk=None):
        post = None

        if postPk is None:
            return Response({'error': 'poskPk is none'}, status=status.HTTP_400_BAD_REQUEST) 
        else:
            try:
                post = Post.objects.get(id=postPk)
                isBookmarked = BookMark.objects.get(user=request.user, post=post) is not None
                serializer = PostSerializer(post, context={'isBookmarked': True})
                return Response(serializer.data, status=status.HTTP_200_OK) 
            except Post.DoesNotExist:
                return Response({'error': 'post is none'}, status=status.HTTP_400_BAD_REQUEST) 
            except BookMark.DoesNotExist:
                serializer = PostSerializer(post, context={'isBookmarked': False})
                return Response(serializer.data, status=status.HTTP_200_OK) 

    def create(self, request):
        serializer = PostCreateSerializer(data=request.data)
        if serializer.is_valid():
            university, newUniversity = University.objects.get_or_create(title=request.data['university'])
            if university == None:
                serializer.save(user=request.user, university=newUniversity)
            else:
                serializer.save(user=request.user, university=university)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)