from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import *

urlpatterns = [
    path('post/<int:postPk>/bookmark', BookmarkView.as_view()),
]
