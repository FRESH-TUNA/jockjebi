from django.shortcuts import get_object_or_404
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from api.serializers.PostSerializer import PostSerializer, PostListSerializer
from api.serializers.UniSerializer import UniSerializer
from api.serializers.CommentSerializer import CommentSerializer
from api.models import *
from django.contrib.auth.models import User
import logging
import json
from django.contrib import auth
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


@csrf_exempt
def signup(request):
    if request.method == 'POST':
        body = json.loads(request.body.decode('utf-8'))
        if body['password1'] == body['password2']:
            User.objects.create_user(
                username=body['username'],
                password=body['password1']
            )
            return JsonResponse({'result': 'success'})

@csrf_exempt
def signin(request):
    if request.method == 'POST':
        body = json.loads(request.body.decode('utf-8'))
        user = auth.authenticate(
            request,
            username=body['username'],
            password=body['password']
        )

        if user is not None:
            auth.login(request, user)
            return JsonResponse({'result': 'success'})
        else:
            return JsonResponse({'result': 'failed'})
    return JsonResponse({'result': 'failed'})

def signout(request):
    auth.logout(request)
    return JsonResponse({'result': 'success'})
    

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    # permission_classes = (IsAuthenticatedOrReadOnly,)

    def list(self, request):
        university = request.GET.get('university', False)
        subject = request.GET.get('subject', False)

        if university is False:
            serializer = PostListSerializer(Post.objects.all(), many=True)
        elif subject is False:
            serializer = PostListSerializer(Post.objects.all().filter(university=university), many=True)
        else:
            serializer = PostListSerializer(Post.objects.all().filter(university=university).filter(subject=subject), many=True)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    #def create(self, request):

    #def retrieve(self, request, pk, format=None):

    # def update(self, request, pk=None):
    #     pass

    # def partial_update(self, request, pk=None):
    #     pass

    # def destroy(self, request, pk=None):
    #     pass

class UniViewSet(viewsets.ModelViewSet):
    queryset = University.objects.all()
    serializer_class = UniSerializer

class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer

    def list(self, request):
        post = request.GET.get('post', False)

        if post is False:
            serializer = CommentSerializer(Comment.objects.all(), many=True)
        else:
            serializer = CommentSerializer(Comment.objects.all().filter(post=post), many=True)
        return Response(serializer.data, status=status.HTTP_201_CREATED)