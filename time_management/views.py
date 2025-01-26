from django.shortcuts import render
from .models import Project
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import TimesheetEntry
from .serializers import TimesheetEntrySerializer
from django.contrib.auth.models import User
from datetime import datetime, timedelta
from django.http import JsonResponse
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view

@api_view(['POST'])
def register_user(request):
    username = request.data.get('username')
    email = request.data.get('email')
    password = request.data.get('password')

    if not username or not email or not password:
        return Response({'error': 'All fields are required'}, status=status.HTTP_400_BAD_REQUEST)

    if User.objects.filter(username=username).exists():
        return Response({'error': 'Username already taken'}, status=status.HTTP_400_BAD_REQUEST)

    user = User.objects.create_user(username=username, email=email, password=password)
    token, created = Token.objects.get_or_create(user=user)

    return Response({'message': 'User created successfully', 'token': token.key}, status=status.HTTP_201_CREATED)

@api_view(['POST'])
def logout_user(request):
    request.user.auth_token.delete()
    return Response({'message': 'Logged out successfully'}, status=status.HTTP_200_OK)

def get_projects(request):
    projects = Project.objects.prefetch_related("tasks").all()

    project_list = [
        {
            "id": project.id,
            "name": project.name,
            "color": project.color,
            "is_active": project.is_active,
            "tasks": [
                {
                    "id": task.id,
                    "task_name": task.task_name
                }
                for task in project.tasks.all()
            ]
        }
        for project in projects
    ]

    return JsonResponse(project_list, safe=False)

class DeleteTimeEntry(APIView):
    def delete(self, request, entry_id, *args, **kwargs):
        try:
            entry = TimesheetEntry.objects.get(id=entry_id)
            entry.delete()  # Delete the entry
            return Response({"detail": "Entry deleted successfully"}, status=status.HTTP_200_OK)
        except TimesheetEntry.DoesNotExist:
            return Response({"detail": "Entry not found"}, status=status.HTTP_404_NOT_FOUND)


class FetchMonthlyData(APIView):
    def get(self, request):
        # Use static user (the first user in the database)
        user = User.objects.first()

        # Parse start_date and end_date from request parameters
        start_date_str = request.query_params.get('start_date')
        end_date_str = request.query_params.get('end_date')

        if not start_date_str or not end_date_str:
            return Response({"error": "Missing start_date or end_date"}, status=status.HTTP_400_BAD_REQUEST)

        try:
            start_date = datetime.strptime(start_date_str, "%Y-%m-%d").date()
            end_date = datetime.strptime(end_date_str, "%Y-%m-%d").date()
        except ValueError:
            return Response({"error": "Invalid date format"}, status=status.HTTP_400_BAD_REQUEST)

        # Filter entries within the date range
        entries = TimesheetEntry.objects.filter(work_date__range=[start_date, end_date])

        # Serialize the data and return it
        serializer = TimesheetEntrySerializer(entries, many=True)
        return Response(serializer.data)
    
class FetchWeeklyData(APIView):
    def get(self, request):
        # Use static user (the first user in the database)
        user = User.objects.first()

        # Parse start_date from request parameters
        start_date_str = request.query_params.get('start_date')
        start_date = datetime.strptime(start_date_str, "%Y-%m-%d").date() if start_date_str else None

        if not start_date:
            return Response({"error": "Invalid date format"}, status=status.HTTP_400_BAD_REQUEST)

        # Calculate the end of the week (6 days after the start date)
        end_date = start_date + timedelta(days=6)
        entries = TimesheetEntry.objects.filter(work_date__range=[start_date, end_date])

        # Serialize the data and return it
        serializer = TimesheetEntrySerializer(entries, many=True)
        return Response(serializer.data)
    
class SubmitEntry(APIView):
    def get_object(self, id):
        try:
            return TimesheetEntry.objects.get(id=id)
        except TimesheetEntry.DoesNotExist:
            return None

    def post(self, request):
        user = User.objects.first()
        if not user:
            return Response({"detail": "No users found in the database."}, status=status.HTTP_400_BAD_REQUEST)

        request.data['user'] = user.id
        serializer = TimesheetEntrySerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, id):
        entry = self.get_object(id)
        if not entry:
            return Response({"detail": "Entry not found."}, status=status.HTTP_404_NOT_FOUND)

        serializer = TimesheetEntrySerializer(entry, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)