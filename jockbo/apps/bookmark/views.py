from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from jockbo.apps.common.models import Post, BookMark
import logging

class BookmarkView(APIView):
    def post(self, request, postPk=None):
        if postPk is None:
            return Response({'error':'postPk is None'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            try:
                BookMark.objects.create(user=request.user, post=Post.objects.get(id=postPk))
                return Response({'bookmark':'success'}, status=status.HTTP_201_CREATED)
            except: return Response({'error':'bookmark or user are None'}, status=status.HTTP_400_BAD_REQUEST) 
            
            
    def delete(self, request, postPk=None):
        if postPk is None:
            return Response({'error':'postPk is None'}, status=status.HTTP_400_BAD_REQUEST)
        else:
            try:
                BookMark.objects.get(user=request.user, post=Post.objects.get(id=postPk)).delete()
                return Response({'bookmark':'deleted'}, status=status.HTTP_204_NO_CONTENT)
            except: return Response({'error':'bookmark or user are None'}, status=status.HTTP_400_BAD_REQUEST)
            
    
