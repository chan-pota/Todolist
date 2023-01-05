<<<<<<< HEAD
from rest_framework import serializers
from .models import *

class TodolistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todolist
=======
from rest_framework import serializers
from .models import *

class TodolistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todolist
>>>>>>> b94a5a2cff9d2606a9ed862915a5e5ea0fd3ffc1
        fields = ('id','title','detail')