from rest_framework.decorators import api_view, permission_classes
from django.shortcuts import get_object_or_404
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
from rest_framework import status, viewsets
from rest_framework.decorators import action
from rest_framework.response import Response
from api.serializers.PostSerializer import PostSerializer, PostCreateSerializer, PostListSerializer
from api.serializers.UniSerializer import UniSerializer
from api.serializers.CommentSerializer import CommentSerializer
from api.models import *
from django.contrib.auth.models import User
import logging
import json
from django.contrib import auth
from django.http import JsonResponse
from django.forms.models import model_to_dict
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def signup(request):
    if request.method == "POST":
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)

        if body['password1'] == body["password2"]:
            user = User.objects.create_user(
                username=body["username"],
                password=body["password1"]
            )
            universityObject, created = University.objects.get_or_create(title=body["university"]) 
            
            Enrollment.objects.create(
                user=user,
                university=universityObject
            )

            return JsonResponse({"signup":"success"})


class UniViewSet(viewsets.ModelViewSet):
    queryset = University.objects.all()
    serializer_class = UniSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)

    @action(detail=True, methods=['post'])
    def getuseruni(self, request):
        logging.error(University.objects.get(enrollment__user=request.user))
        serializer = UniSerializer()
        return Response(serializer.data, status=status.HTTP_200_OK)

@api_view(http_method_names=['GET'])
@permission_classes([IsAuthenticated])
def getuseruni(request):
    logging.error(request.user)
    university = University.objects.get(enrollment__user=request.user)
    serializer = UniSerializer(university)
    return Response(serializer.data, status=status.HTTP_200_OK)

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def list(self, request):
        queryset = Post.objects.all()
        university = request.GET.get('university', False)
        subject = request.GET.get('subject', False)
        bookmark = request.GET.get('bookmark', False)

        if university is not False:
            queryset = queryset.filter(university=university)
        if subject is not False:
            queryset = queryset.filter(subject__contains=subject)
        if bookmark is not False:
            queryset = queryset.filter(user=request.user)

        serializer = PostListSerializer(queryset, many=True)
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




class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)

    def list(self, request, postPk=None):
        queryset = Comment.objects.all()

        if postPk is not None:
            queryset = queryset.filter(post=Post.objects.get(id=postPk))

        serializer = CommentSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def create(self, request, postPk=None):
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user, post=Post.objects.get(id=postPk))
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
