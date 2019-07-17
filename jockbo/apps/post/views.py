from rest_framework import status, viewsets
from jockbo.apps.common.models import Post
from .serializers import *

class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    # permission_classes = (IsOwnerOrReadOnly,)

    def list(self, request):
        queryset = Post.objects.all()
        university = request.GET.get('university', False)
        subject = request.GET.get('subject', False)
        bookmark = request.GET.get('bookmark', False)

        if university is not False:
            queryset = queryset.filter(university=university)
        if subject is not False:
            queryset = queryset.filter(subject__contains=subject)
        if bookmark is not False:
            queryset = queryset.filter(user=request.user)

        serializer = PostListSerializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def create(self, request):
        serializer = PostCreateSerializer(data=request.data)
        if serializer.is_valid():
            university, newUniversity = University.objects.get_or_create(title=request.data['university'])
            if university == None:
                serializer.save(user=request.user, university=newUniversity)
            else:
                serializer.save(user=request.user, university=university)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)