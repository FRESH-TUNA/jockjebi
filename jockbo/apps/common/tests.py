from django.test import TestCase
from jockbo.apps.common.models import University
from django.db import models

class DBConnectTestCase(TestCase):
    def setUp(self):
        University.objects.create(title='hoho')
    def dbConnecttest(self):
        post = University.objects.get(id=1)
        self.assertEqual(post.title, 'hohso')

