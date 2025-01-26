from django.contrib import admin
from .models import Project, ProjectCategory

@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ['name', 'description', 'category', 'owner', 'created_at', 'color', 'is_active']

@admin.register(ProjectCategory)
class ProjectCategoryAdmin(admin.ModelAdmin):
    list_display = ('main_category', 'sub_category')