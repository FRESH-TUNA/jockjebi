from django.test import TestCase
from jockbo.apps.jockboAuth.models import User
from jockbo.apps.common.models import University
from django.db import models
from django.test import Client, RequestFactory
from .views import signup
import json

class CustomUserModelTest(TestCase):
    def setUp(self):
        University.objects.create(title='한양대학교')
        User.objects.create_user(email='test@gmail.com', password='1234', nickname='tuna', university=University.objects.get(id=1))
    
    def UserModelTest(self):
        user = User.objects.get(id=1)
        self.assertEqual(user.email, 'test@gmail.com')
        # self.assertEqual(user.password, 'password')
        self.assertEqual(user.nickname, 'tuna')
        self.assertEqual(user.university.title, '한양대학교')

    def UserCreateResponseTest(self):
        c = Client()
        response = c.post('/api/signup', 
                json.dumps({
                    'email': 'testResponse@gmail.com',
                    'password1': '1234',
                    'password2': '1234',
                    'university': '한양대학교',
                    'nickname': 'testResponse',
                }),
                content_type="application/json")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content,  b'{"signup":"success"}')
        

        user = User.objects.get(email='testResponse@gmail.com')
        self.assertEqual(user.nickname, 'testResponse')
        self.assertEqual(user.university.title, '한양대학교')
