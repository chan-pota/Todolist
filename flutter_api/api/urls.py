<<<<<<< HEAD
from django.urls import path
from .views import *


urlpatterns = [
    path('', first_api, name="first-api"),
    path('api/all-todolist/', all_todolist, name="todolist"),
    path('api/create-todolist', post_todolist, name="create-todolist"),
    path('api/update-todolist/<int:TID>', update_todolist, name='update-todolist'),
    path('api/delete-todolist/<int:TID>', delete_todolist, name="delete-todolist")
=======
from django.urls import path
from .views import *


urlpatterns = [
    path('', first_api, name="first-api"),
    path('api/all-todolist/', all_todolist, name="todolist"),
    path('api/create-todolist', post_todolist, name="create-todolist"),
    path('api/update-todolist/<int:TID>', update_todolist, name='update-todolist'),
    path('api/delete-todolist/<int:TID>', delete_todolist, name="delete-todolist")
>>>>>>> b94a5a2cff9d2606a9ed862915a5e5ea0fd3ffc1
]