from django.db import models
from django.contrib.auth.models import User

class ProjectCategory(models.Model):
    name = models.CharField(max_length=100, unique=True)
    description = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.name

class Project(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField()
    owner = models.ForeignKey(User, on_delete=models.CASCADE)  # Link to Django's built-in User model
    category = models.ForeignKey(ProjectCategory, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class DailyWorkHour(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Link to Django's built-in User model
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    work_date = models.DateField()
    hours_worked = models.DecimalField(max_digits=5, decimal_places=2)
    task_number = models.IntegerField()
    notes = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user} - {self.project} - {self.work_date}'
