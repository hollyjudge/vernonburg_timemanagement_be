from django.db import models
from django.contrib.auth.models import User

class ProjectCategory(models.Model):
    main_category = models.CharField(max_length=100)  # Main category (e.g., Business Development)
    sub_category = models.CharField(max_length=100)  # Sub-category (e.g., Business Development - USTDA)

    class Meta:
        unique_together = ('main_category', 'sub_category') 

    def __str__(self):
        return f"{self.main_category} - {self.sub_category}"

class Project(models.Model):
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)
    owner = models.ForeignKey(User, on_delete=models.CASCADE)  # Link to Django's built-in User model
    category = models.ForeignKey(ProjectCategory, on_delete=models.SET_NULL, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    color = models.CharField(max_length=7, blank=True, null=True)  
    is_active = models.BooleanField(default=True) 
    
    def __str__(self):
        return self.name

class ProjectTask(models.Model):
    project = models.ForeignKey(Project, on_delete=models.CASCADE, related_name='tasks')
    task_name = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.project.name} - {self.task_name}'

class TimesheetEntry(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Link to Django's built-in User model
    project = models.ForeignKey(Project, on_delete=models.CASCADE)
    task = models.ForeignKey(ProjectTask, on_delete=models.SET_NULL, null=True, blank=True) 
    work_date = models.DateField()
    hours_worked = models.DecimalField(max_digits=5, decimal_places=2)
    task_number = models.CharField(max_length=255, null=True, blank=True)
    notes = models.TextField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user} - {self.project} - {self.work_date}'
