from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from jockbo.apps.common.models import University
from .models import User
import logging
import json

from django.contrib import auth
from django.http import JsonResponse
from django.forms.models import model_to_dict
from rest_framework.response import Response

from rest_framework.decorators import api_view
from rest_framework.decorators import parser_classes
from rest_framework.parsers import JSONParser
from django.shortcuts import redirect

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import CustomTokenObtainPairSerializer

@api_view(['POST'])
@parser_classes([JSONParser])
def signup(request):
    if request.method == "POST":
        if request.data['password1'] == request.data["password2"]:
            user = {}

            if request.data['university'] is not '':
                universityObject, created = University.objects.get_or_create(
                    title=request.data["university"])
                if universityObject is None:
                    universityObject = created
                user = User.objects.create_user(
                    email=request.data['email'],
                    password=request.data['password1'],
                    university=request.data["university"],
                    nickname=request.data['nickname'],
                )
            else:
                user = User.objects.create_user(
                    email=request.data['email'],
                    password=request.data['password1'],
                    nickname=request.data['nickname'],
                )
            
            serializer = TokenObtainPairSerializer(data={'email': request.data['email'], 'password': request.data['password1']})

            if serializer.is_valid():
                serializer.validated_data['university'] = request.data['university']
                serializer.validated_data['nickname'] = request.data['nickname']
                return Response(serializer.validated_data)
            

class signinView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer