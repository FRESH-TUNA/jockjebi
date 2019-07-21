from django.test import TestCase
from jockbo.apps.jockboAuth.models import User
from jockbo.apps.common.models import University
from django.db import models
from django.test import Client, RequestFactory
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
        
        user = User.objects.get(email='testResponse@gmail.com')
        self.assertEqual(user.nickname, 'testResponse')
        self.assertEqual(user.university, '한양대학교')

    def UserLoginResponseTest(self):
        c = Client()

        c.post('/api/signup', 
                json.dumps({
                    'email': 'testResponse@gmail.com',
                    'password1': '1234',
                    'password2': '1234',
                    'university': '한양대학교',
                    'nickname': 'testResponse',
                }),
                content_type="application/json")

        response = c.post('/api/token', 
                json.dumps({
                    'email': 'testResponse@gmail.com',
                    'password': '1234',
                }),
                content_type="application/json")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data['nickname'], 'testResponse')     #dict형태로도 확인할수 있다.
        # self.assertEqual(response.content, 'testResponse')            #binary형태로 확인할수도 있지롱
        self.assertEqual(response.data['university'], '한양대학교')

#UserCreateResponseTest 
#http post http://127.0.0.1:8000/api/signup email=root@gmail.com password1=xxx.. password2=xxx.. university='한양대학교' nickname=root
