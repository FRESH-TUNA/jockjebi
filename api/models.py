from django.db import models
from django.contrib.auth.models import User


class University(models.Model):
    title = models.CharField(max_length=50)

class Enrollment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, unique=True)
    university = models.ForeignKey(University, on_delete=models.CASCADE)

class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    university = models.ForeignKey(University, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    professor = models.CharField(max_length=50)
    year = models.IntegerField()
    semester = models.IntegerField(default = 0)

    haveAnswer = models.BooleanField(default=False)
    category = models.CharField(max_length=50)
    file = models.ImageField(blank=True)
    explain = models.TextField(blank=True)
    bookmark_user_list = models.ManyToManyField(User, blank=True, related_name='bookmark_user_set', through='BookMark')
    pub_date = models.DateTimeField(auto_now_add=True)
    

class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    content = models.TextField()


class BookMark(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    class Meta:
        unique_together = (('user', 'post'))

