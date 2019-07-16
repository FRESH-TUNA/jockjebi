from api.views import *
from rest_framework.routers import DefaultRouter
from django.urls import path



router = DefaultRouter(trailing_slash=False)
urlpatterns = [
    path('getuseruni', getuseruni),
    path('signup', signup),

    path('post/<int:postPk>/comment', CommentList.as_view()),
    path('comment/<int:commentPk>', CommentDetail.as_view())
]


router.register(r'post', PostViewSet, basename='post')

router.register(r'university', UniViewSet, basename='university')

urlpatterns += router.urls