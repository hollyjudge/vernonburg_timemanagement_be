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

def get_projects(request):
    projects = Project.objects.values("id", "name", "color")
    return JsonResponse(list(projects), safe=False)

class DeleteTimeEntry(APIView):
    def delete(self, request, entry_id, *args, **kwargs):
        try:
            # Find the time entry by ID
            entry = TimesheetEntry.objects.get(id=entry_id)
            entry.delete()  # Delete the entry
            return Response({"detail": "Entry deleted successfully"}, status=status.HTTP_204_NO_CONTENT)
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
    def post(self, request):
        # Ensure we have a valid user in the database
        user = User.objects.first()  
        print(f"Received request data: {request.data}") 
        if user is None:
            return Response({"detail": "No users found in the database."}, status=status.HTTP_400_BAD_REQUEST)
        
        try:
            project = Project.objects.get(id=request.data.get('project'))
        except Project.DoesNotExist:
            return Response({"detail": "Project does not exist."}, status=status.HTTP_400_BAD_REQUEST)

        # Set the user ID in the request data
        request.data['user'] = user.id  # Manually set the user ID in request data

        # Proceed with normal serialization and saving
        serializer = TimesheetEntrySerializer(data=request.data)

        if serializer.is_valid():
            serializer.save()
            print(f"Saved entry: {serializer.data}")  
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)