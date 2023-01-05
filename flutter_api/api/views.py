<<<<<<< HEAD
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .serializers import TodolistSerializer
from .models import *

# get data

@api_view(['GET'])
def all_todolist(request):
   query = Todolist.objects.all().order_by('id')
   serializer = TodolistSerializer(query, many=True) # ถ้ามีหลายข้อมูลต้องบอก many=true
   return Response(serializer.data, status=status.HTTP_200_OK)

#
@api_view(['POST'])
def post_todolist(request):
   if request.method == 'POST':
      serializer = TodolistSerializer(data=request.data)
      if serializer.is_valid():
         serializer.save()
         return Response(serializer.data, status=status.HTTP_201_CREATED)
      return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)

@api_view(['PUT'])
def update_todolist(request, TID):
   query = Todolist.objects.get(id=TID)
   if request.method == 'PUT':
      data = {}
      serializer = TodolistSerializer(query, data=request.data)
      if serializer.is_valid():
         serializer.save()
         data['status'] = 'update'
         return Response(data=data, status=status.HTTP_201_CREATED)
      return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)

@api_view(['DELETE'])
def delete_todolist(request, TID):
   
   if request.method == 'DELETE':
      query = Todolist.objects.get(id=TID)
      data = {}
      if query.delete():
         data['data'] = "sucess"
         return Response(data=data, status=status.HTTP_204_NO_CONTENT)
      else: 
         data['data'] = "fail"
      return Response(data=data, status=status.HTTP_404_NOT_FOUND)
         

   


# Create your views here.

def first_api(request):
    data = [
    {
       "title":"Best plan for workout routine",
       "subtitle":"Cario is first step to lose your weight",
       "url":"https://th.bing.com/th/id/OIP.u9ZYTpb73zPFfw88boRHgQHaE7?pid=ImgDet&rs=1",
       "detail":"Runing is the best for lose weight",
       "page":"1" 
    },
    {
        "title":"Best food for lose your weight",
        "subtitle":"The vegetable is the best for lose weight",
        "url":"https://th.bing.com/th/id/OIP.t-jHIT1A8i386BYod4dqzAHaHa?pid=ImgDet&rs=1",
        "detail":"Salad is the best for diet",
        "page":"2" 
     },
     {
        "title":"Add your schedule workout",
        "subtitle":"Several time in week is enough for lose weight",
        "url":"https://th.bing.com/th/id/OIP.W7r25V-dqXPVKUJWo3uanQHaHZ?pid=ImgDet&rs=1",
        "detail":"Morning or Evening routine is the best for workout",
        "page":"3" 
     }
    ]
    return JsonResponse(data=data, safe=False, json_dumps_params={'ensure_ascii': False})
=======
from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .serializers import TodolistSerializer
from .models import *

# get data

@api_view(['GET'])
def all_todolist(request):
   query = Todolist.objects.all().order_by('id')
   serializer = TodolistSerializer(query, many=True) # ถ้ามีหลายข้อมูลต้องบอก many=true
   return Response(serializer.data, status=status.HTTP_200_OK)

#
@api_view(['POST'])
def post_todolist(request):
   if request.method == 'POST':
      serializer = TodolistSerializer(data=request.data)
      if serializer.is_valid():
         serializer.save()
         return Response(serializer.data, status=status.HTTP_201_CREATED)
      return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)

@api_view(['PUT'])
def update_todolist(request, TID):
   query = Todolist.objects.get(id=TID)
   if request.method == 'PUT':
      data = {}
      serializer = TodolistSerializer(query, data=request.data)
      if serializer.is_valid():
         serializer.save()
         data['status'] = 'update'
         return Response(data=data, status=status.HTTP_201_CREATED)
      return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)

@api_view(['DELETE'])
def delete_todolist(request, TID):
   
   if request.method == 'DELETE':
      query = Todolist.objects.get(id=TID)
      data = {}
      if query.delete():
         data['data'] = "sucess"
         return Response(data=data, status=status.HTTP_204_NO_CONTENT)
      else: 
         data['data'] = "fail"
      return Response(data=data, status=status.HTTP_404_NOT_FOUND)
         

   


# Create your views here.

def first_api(request):
    data = [
    {
       "title":"Best plan for workout routine",
       "subtitle":"Cario is first step to lose your weight",
       "url":"https://th.bing.com/th/id/OIP.u9ZYTpb73zPFfw88boRHgQHaE7?pid=ImgDet&rs=1",
       "detail":"Runing is the best for lose weight",
       "page":"1" 
    },
    {
        "title":"Best food for lose your weight",
        "subtitle":"The vegetable is the best for lose weight",
        "url":"https://th.bing.com/th/id/OIP.t-jHIT1A8i386BYod4dqzAHaHa?pid=ImgDet&rs=1",
        "detail":"Salad is the best for diet",
        "page":"2" 
     },
     {
        "title":"Add your schedule workout",
        "subtitle":"Several time in week is enough for lose weight",
        "url":"https://th.bing.com/th/id/OIP.W7r25V-dqXPVKUJWo3uanQHaHZ?pid=ImgDet&rs=1",
        "detail":"Morning or Evening routine is the best for workout",
        "page":"3" 
     }
    ]
    return JsonResponse(data=data, safe=False, json_dumps_params={'ensure_ascii': False})
>>>>>>> b94a5a2cff9d2606a9ed862915a5e5ea0fd3ffc1
