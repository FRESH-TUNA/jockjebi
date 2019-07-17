from .views import *
from rest_framework.routers import DefaultRouter
from django.urls import path

router = DefaultRouter(trailing_slash=False)
router.register(r'post', PostViewSet, basename='post')

urlpatterns = router.urls