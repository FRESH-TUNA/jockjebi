from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from jockbo.apps.common.models import Post, BookMark
from rest_framework.permissions import IsAuthenticated

class BookmarkView(APIView):
    permission_classes = [IsAuthenticated]          #인증되지 않으면 401반환

    def post(self, request, postPk):
            try:
                BookMark.objects.create(
                    user=request.user, post=Post.objects.get(id=postPk))
                return Response({'bookmark': 'success'}, status=status.HTTP_201_CREATED)
            except BookMark.DoesNotExist:
                return Response({'error': 'bookmark is None'}, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, postPk):
            try:
                BookMark.objects.get(
                    user=request.user, post=Post.objects.get(id=postPk)).delete()
                return Response({'bookmark': 'deleted'}, status=status.HTTP_204_NO_CONTENT)
            except:
                return Response({'error': 'bookmark or user are None'}, status=status.HTTP_400_BAD_REQUEST)
