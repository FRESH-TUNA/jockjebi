from rest_framework import serializers
from jockbo.apps.common.models import Post

class PostSerializer(serializers.ModelSerializer):
    publishedDate = serializers.ReadOnlyField()
    username = serializers.ReadOnlyField()
    universityTitle = serializers.ReadOnlyField()
    isBookmarked = serializers.SerializerMethodField('getIsBookmarked') #custom 필드는 이렇게

    class Meta:
        model = Post
        exclude = ('user', 'pub_date', 'university')
    
    def getIsBookmarked(self, obj):
        return self.context['isBookmarked']


class PostCreateSerializer(serializers.ModelSerializer):    
    class Meta:
        model = Post
        exclude = ('user', 'university',)

class PostListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'
