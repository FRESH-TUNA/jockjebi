from django.db import models

class University(models.Model):
    title = models.CharField(max_length=50)

class Post(models.Model):
    university = models.ForeignKey(University, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    professor = models.CharField(max_length=50)
    year = models.IntegerField()
    semester = models.IntegerField(default = 0)
    category = models.CharField(max_length=50)
    file = models.ImageField(blank=True)
    explain = models.TextField(blank=True)
    
    

class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    content = models.TextField()

