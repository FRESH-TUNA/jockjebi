from jockbo.settings.base import *

SECRET_KEY = 'asdfasdfadsfsdfadsdfsdfasf'

DEBUG = True

ALLOWED_HOSTS = []

CORS_ORIGIN_ALLOW_ALL = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'openhack',
        'USER': 'openhackuser',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '',
    }
}

