from django.apps import AppConfig


class CommonConfig(AppConfig):
    name = 'jockbo.apps.common'     #model이 있는 폴더
    label = 'api'   #실제 migration이나 db에 적용되는 라벨
