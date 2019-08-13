from django.test import TestCase
from jockbo.apps.common.models import Post, BookMark, University
from jockbo.apps.jockboAuth.models import User

from django.db import models
from .views import PostViewSet
from django.test import Client
import json 

class TestAnimalTestCase(TestCase):
    def setUp(self):
        university = University.objects.create(title="한양대학교")
        user = User.objects.create_user(university="한양대학교", email="hoho@gmail.com", password='1234', nickname='1234')
        post = Post.objects.create(
            user=user, subject='수학', university=university,
            professor='강아지', year='2014',
            semester=2, haveAnswer=True, category='교양필수'
        )
        BookMark.objects.create(user=user, post=post)
    def test_postList(self):
        c = Client()
        response = c.get('/api/post?subject=수학&?university=한양대학교&?professor=강아지&?fromYear=2013&?toYear=2015&?semester=2&?haveAnswer=true&?category=교양필수')
        self.assertEqual(response.data, 'testResponse')     

    def test_postRetrieveTest(self):
        request = {'user': User.objects.get(id=1)}
        response = PostViewSet.retrieve(request, 1)
        self.assertEqual(response.data.isBookmarked, True)
    
    def test_postDeleteTest(self):
        c = Client()
        response = c.delete('/api/post/1') 
        self.assertEqual(response.status_code, 204)

    def test_postFetchTest(self):
        c = Client()
        response = c.put('/api/post/1', 
            json.dumps({
                'university': '테스트대학교',
                'subject': '수정 테스트',
                'semester': '1',
                'category': '전필',
            }),
        content_type="application/json")
    
        post = Post.objects.get(id=1)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(post.university.title, '테스트대학교')
        self.assertEqual(response.data['semester'], 1)
        self.assertEqual(response.data['subject'], '수정 테스트')
        self.assertEqual(response.data['category'], '전필')
