from rest_framework import serializers
from jockbo.apps.common.models import Post
import logging
from django.db.models import Avg, Count, Func, Q

class Round(Func):
    function = "ROUND"
    template = "%(function)s(%(expressions)s::numeric, 1)"

class PostSerializer(serializers.ModelSerializer):
    publishedDate = serializers.ReadOnlyField()
    username = serializers.ReadOnlyField()
    universityTitle = serializers.ReadOnlyField()
    isBookmarked = serializers.SerializerMethodField('getIsBookmarked', required=False) #custom 필드는 이렇게
    isOwner = serializers.SerializerMethodField('getIsOwner', required=False) #custom 필드는 이렇게
    star = serializers.SerializerMethodField('get_avg_star')

    class Meta:
        model = Post
        exclude = ('user', 'pub_date', 'university')
    
    def getIsBookmarked(self, obj):
        logging.error(dict.keys(self.context))
        return self.context['isBookmarked']

    def getIsOwner(self, obj):
        return self.context['request'].user == obj.user

    def get_avg_star(self, obj):
        return obj.comments.aggregate(Avg('star'))['star__avg']


class PostCreateSerializer(serializers.ModelSerializer):    
    class Meta:
        model = Post
        exclude = ('user', 'university')

class PostListSerializer(serializers.ModelSerializer):
    star = serializers.FloatField()

    class Meta:
        model = Post
        fields = '__all__'
