from django.db import models
from django.conf import settings

class University(models.Model):
    title = models.CharField(max_length=50)

class Post(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    university = models.ForeignKey(University, on_delete=models.CASCADE)
    subject = models.CharField(max_length=50)
    professor = models.CharField(max_length=50)
    year = models.IntegerField() 
    semester = models.IntegerField(default = 0)   #0, 1, 2, 3, 1학기 여름학기 2학기 겨울학기

    haveAnswer = models.BooleanField(default=False)
    category = models.CharField(max_length=50)
    file = models.FileField(null=True)
    explain = models.TextField(blank=True)
    bookmark_user_list = models.ManyToManyField(settings.AUTH_USER_MODEL, blank=True, related_name='bookmark_user_set', through='BookMark')
    pub_date = models.DateTimeField(auto_now_add=True)
    
    @property
    def publishedDate(self):
        return self.pub_date.strftime('%B %d %Y')
    
    @property
    def username(self):
        return self.user.username
    
    @property
    def universityTitle(self):
        return self.university.title
    

class Comment(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comments')
    content = models.TextField(blank=True)
    star = models.IntegerField(default=0)


class BookMark(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    class Meta:
        unique_together = (('user', 'post'))

