# serializers.py
from rest_framework import serializers
from .models import TimesheetEntry

class TimesheetEntrySerializer(serializers.ModelSerializer):
    project_name = serializers.CharField(source='project.name', read_only=True)
    project_color = serializers.CharField(source='project.color', read_only=True)

    class Meta:
        model = TimesheetEntry
        fields = [
            'id',
            'user',
            'project',
            'project_name',  # Include project name
            'project_color',  # Include project color
            'work_date',
            'hours_worked',
            'task_number',
            'notes',
            'created_at',
        ]
