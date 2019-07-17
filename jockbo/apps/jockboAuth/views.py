from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated

from django.contrib.auth.models import User
import logging
import json
from django.contrib import auth
from django.http import JsonResponse
from django.forms.models import model_to_dict
from rest_framework.response import Response

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


@api_view(http_method_names=['GET'])
@permission_classes([IsAuthenticated])
def getuseruni(request):
    university = University.objects.get(enrollment__user=request.user)
    serializer = UniSerializer(university)
    return Response(serializer.data, status=status.HTTP_200_OK)