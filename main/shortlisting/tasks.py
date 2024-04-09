from celery import shared_task



@shared_task
def select_student_task():
    from shortlisting.views import select_students as select_students_function
    select_students_function()