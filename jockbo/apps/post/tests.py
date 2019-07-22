from django.test import TestCase
from jockbo.apps.common.models import Post, BookMark
from jockbo.apps.jockboAuth.models import User

from django.db import models
from .views import PostViewSet
from django.test import Client

class AnimalTestCase(TestCase):
    def setUp(self):
        user = User.objects.create()
        post = Post.objects.create(user=user, year=1, university_id=1)
        BookMark.objects.create(user=user, post=post)

    def postRetrieveTest(self):
        request = {'user': User.objects.get(id=1)}
        response = PostViewSet.retrieve(request, 1)
        self.assertEqual(response.data.isBookmarked, True)
    
    def postDeleteTest(self):
        c = Client()
        response = c.delete('/api/post/1') 
        self.assertEqual(response.status_code, 204)