from rest_framework import serializers
from api.models import Post

class PostSerializer(serializers.ModelSerializer):
    publishedDate = serializers.ReadOnlyField()
    username = serializers.ReadOnlyField()
    
    class Meta:
        model = Post
        exclude = ('user', 'pub_date')

class PostCreateSerializer(serializers.ModelSerializer):    
    class Meta:
        model = Post
        exclude = ('user', 'university',)

class PostListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'
