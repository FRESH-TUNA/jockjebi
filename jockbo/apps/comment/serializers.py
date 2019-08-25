from rest_framework import serializers
from jockbo.apps.common.models import Comment

class CommentSerializer(serializers.ModelSerializer):
    isOwner = serializers.SerializerMethodField('getIsOwner') #custom 필드는 이렇게

    class Meta:
        model = Comment
        fields = '__all__'
    
    def getIsOwner(self, obj):
        logging.error(self.context['request'].user)
        return self.context['request'].user == obj.user

class CommentCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ('content', 'star')
