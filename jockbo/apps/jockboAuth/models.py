from django.db import models
from django.contrib.auth.models import (BaseUserManager, AbstractBaseUser)
from jockbo.apps.common.models import University

class UserManager(BaseUserManager):
    def create_user(self, email, password, nickname, university=None):
        if not email:
            raise ValueError('Users must have an email address')
        if not nickname:
            raise ValueError('Users must have an nickname')

        user = self.model(
            email=self.normalize_email(email),
            nickname=nickname,
            university=university
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, nickname, university=None):
        user = self.create_user(
            email,
            password=password,
            university=university,
            nickname=nickname
        )
        user.is_admin = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser):
    email = models.EmailField(
        verbose_name='email',
        max_length=255,
        unique=True,                                #username으로 쓰고싶은것에 반드시 unique 지정
    )
    nickname = models.CharField(max_length=30)
    university = models.CharField(max_length=100)
    # university = models.ForeignKey(University, on_delete=models.SET_NULL, null=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'email'                        #username으로 사용된다. 반드시 unique일것
    REQUIRED_FIELDS = ['nickname']                  #when command line createsuperuser시만 적용된다.

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin