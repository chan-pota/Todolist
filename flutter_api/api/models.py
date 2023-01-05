<<<<<<< HEAD
from django.db import models

# Create your models here.


class Todolist(models.Model):
    title = models.CharField(max_length=100)
    detail = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.title
=======
from django.db import models

# Create your models here.


class Todolist(models.Model):
    title = models.CharField(max_length=100)
    detail = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.title
>>>>>>> b94a5a2cff9d2606a9ed862915a5e5ea0fd3ffc1
