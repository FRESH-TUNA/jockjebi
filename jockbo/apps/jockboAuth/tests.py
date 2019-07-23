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
        self.assertEqual(response.data['nickname'], 'testResponse')     
        self.assertEqual(response.data['university'], '한양대학교')
        self.assertEqual(response.data['access'], '한양대학교')     #token의 유무만 판단하는 용도로 사용
        self.assertEqual(response.data['refresh'], '한양대학교')    #token의 유무만 판단하는 용도로 사용

        ##실제로 유저가 생성되었는지 테스트한다.
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
    
    def UserTokenVerifyTest(self):
        c = Client()

        response = c.post('/api/token', 
                json.dumps({
                    'email': 'test@gmail.com',
                    'password': '1234',
                }),
                content_type="application/json")

        response = c.post('/api/token/verify',
                json.dumps({'token': response.data['access']}),
                content_type="application/json")

        self.assertEqual(response.status_code, 200)

    def UserTokenUpdateTest(self):
        c = Client()

        response = c.post('/api/token', 
                json.dumps({
                    'email': 'test@gmail.com',
                    'password': '1234',
                }),
                content_type="application/json")

        response = c.post('/api/token/refresh',
                json.dumps({'refresh': response.data['refresh']}),
                content_type="application/json")

        self.assertEqual(response.status_code, 200)
        
