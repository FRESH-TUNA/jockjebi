from api.views import *
from rest_framework.routers import DefaultRouter
from django.urls import path
from .views import *

urlpatterns = [
    path('post/<int:postPk>/comment', CommentList.as_view()),
    path('comment/<int:commentPk>', CommentDetail.as_view())
]
