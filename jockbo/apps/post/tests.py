from django.test import TestCase
from jockbo.apps.common.models import Post, BookMark, University
from jockbo.apps.jockboAuth.models import User

from django.db import models
from .views import PostViewSet
from django.test import Client

class AnimalTestCase(TestCase):
    def setUp(self):
        user = User.objects.create()
        university = University.objects.create(title="한양대학교")
        post = Post.objects.create(
            user=user, subject='수학', university=university,
            professor='강아지', year='2014',
            semester=2, haveAnswer=True, category='교양필수'
        )
        BookMark.objects.create(user=user, post=post)

    def postListTest(self):
        c = Client()
        response = c.get('/api/post?subject=수학&?university=한양대학교&?professor=강아지&?fromYear=2013&?toYear=2015&?semester=2&?haveAnswer=true&?category=교양필수')
        self.assertEqual(response.data, 'testResponse')     

    def postRetrieveTest(self):
        request = {'user': User.objects.get(id=1)}
        response = PostViewSet.retrieve(request, 1)
        self.assertEqual(response.data.isBookmarked, True)
    
    def postDeleteTest(self):
        c = Client()
        response = c.delete('/api/post/1') 
        self.assertEqual(response.status_code, 204)
