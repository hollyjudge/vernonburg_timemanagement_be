from django.urls import path
from .views import FetchWeeklyData, SubmitEntry, DeleteTimeEntry, FetchMonthlyData
from . import views

urlpatterns = [
    path('timesheets/weekly', FetchWeeklyData.as_view(), name='fetch_weekly_data'),
    path('timesheets/entry', SubmitEntry.as_view(), name='submit_entry'),
    path('timesheets/projects/', views.get_projects, name='get_projects'),
    path('timesheets/entry/<int:entry_id>/delete/', DeleteTimeEntry.as_view(), name='delete_time_entry'),
    path('timesheets/monthly', FetchMonthlyData.as_view(), name='fetch_monthly_data'),
]
