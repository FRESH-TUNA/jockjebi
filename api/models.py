from django.db import models

# Create your models here.
class Post(models.Model):
    subject = models.CharField(max_length=50)
    professor = models.CharField(max_length=50)
    year = models.IntegerField()
    semester = models.IntegerField(default = 0)
    category = models.IntegerField(default = 0)
    file = models.FileField(null = True)
