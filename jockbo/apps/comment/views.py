from rest_framework.views import APIView
from .serializers import *
from jockbo.apps.common.permissions import IsOwnerOrReadOnly

class CommentList(APIView):
    permission_classes = (IsOwnerOrReadOnly,)

    def get(self, request, postPk=None):
        queryset = Comment.objects.all()
        if postPk is not None:
            queryset = queryset.filter(post=Post.objects.get(id=postPk))
        serializer = CommentSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, postPk=None):
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user, post=Post.objects.get(id=postPk))
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class CommentDetail(APIView):
    def get_object(self, commentPk):
        return Comment.objects.get(id=commentPk)

    def put(self, request, commentPk, format=None):
        comment = self.get_object(commentPk)
        serializer = CommentSerializer(comment, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_202_ACCEPTED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, commentPk, format=None):
        snippet = self.get_object(commentPk)
        snippet.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)