from rest_framework import serializers
from jockbo.apps.common.models import Post
import logging

class PostSerializer(serializers.ModelSerializer):
    publishedDate = serializers.ReadOnlyField()
    username = serializers.ReadOnlyField()
    universityTitle = serializers.ReadOnlyField()
    isBookmarked = serializers.SerializerMethodField('getIsBookmarked', required=False) #custom 필드는 이렇게
    isOwner = serializers.SerializerMethodField('getIsOwner', required=False) #custom 필드는 이렇게

    class Meta:
        model = Post
        exclude = ('user', 'pub_date', 'university')
    
    def getIsBookmarked(self, obj):
        logging.error(dict.keys(self.context))
        return self.context['isBookmarked']

    def getIsOwner(self, obj):
        return self.context['request'].user == obj.user


class PostCreateSerializer(serializers.ModelSerializer):    
    class Meta:
        model = Post
        exclude = ('user', 'university')

class PostListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'
