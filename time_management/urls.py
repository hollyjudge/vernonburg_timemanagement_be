from django.urls import path
from .views import FetchWeeklyData, SubmitEntry, DeleteTimeEntry, FetchMonthlyData, register_user, logout_user
from . import views
from rest_framework.authtoken.views import obtain_auth_token 

urlpatterns = [
    path('timesheets/weekly/', FetchWeeklyData.as_view(), name='fetch_weekly_data'),
    path('timesheets/entry/', SubmitEntry.as_view(), name='create-entry'),
    path('timesheets/entry/<int:id>/', SubmitEntry.as_view(), name='update-entry'), 
    path('timesheets/projects/', views.get_projects, name='get_projects'),
    path('timesheets/entry/<int:entry_id>/delete/', DeleteTimeEntry.as_view(), name='delete_time_entry'),
    path('timesheets/monthly/', FetchMonthlyData.as_view(), name='fetch_monthly_data'),
    path('timesheets/auth/login/', obtain_auth_token, name='api_token_auth'),  # Login
    path('timesheets/auth/register/', register_user, name='register_user'),  # Register
    path('timesheets/auth/logout/', logout_user, name='logout_user'), 
]
