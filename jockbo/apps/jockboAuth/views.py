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
                    university=universityObject,
                    nickname=request.data['nickname'],
                )
            else:
                user = User.objects.create_user(
                    email=request.data['email'],
                    password=request.data['password1'],
                    nickname=request.data['nickname'],
                )

            return Response({"signup": "success"})


@api_view(http_method_names=['GET'])
@permission_classes([IsAuthenticated])
def getuseruni(request):
    university = University.objects.get(enrollment__user=request.user)
    serializer = UniSerializer(university)
    return Response(serializer.data, status=status.HTTP_200_OK)
