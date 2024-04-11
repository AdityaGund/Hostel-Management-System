from django.core.management.base import BaseCommand
from registration.models import ThirdYear
from registration.databasegeneration import thirdyear_data

class Command(BaseCommand):
    help = 'Populate second year table with data'

    def handle(self, *args, **options):
        for branch, students in thirdyear_data.items():
            branch_name = self.get_branch_name(branch)
            branch_students = []
            for student_index, student in enumerate(students, start=1):
                student_id = self.calculate_student_id(branch, student_index)
                student_data = {
                    'id': student_id,
                    'application_id': student['MIS No'],
                    'email': self.generate_email(student_index, branch_name),
                    'name': student['Name'],
                    'rank': float(student['CGPA']),
                    'branch': branch_name
                }
                branch_students.append(student_data)
            ThirdYear.objects.bulk_create([ThirdYear(**student) for student in branch_students])
        self.stdout.write(self.style.SUCCESS('Successfully populated second year'))

    def get_branch_name(self, branch_code):
        branches = {
            '03': 'computer engineering',
            '01': 'civil engineering',
            '05': 'electrical engineering',
            '09': 'instrumentation engineering',
            '10': 'mechanical engineering',
            '13': 'manufacturing engineering'
        }
        return branches.get(branch_code, 'Unknown')
    
    def calculate_student_id(self, branch_code, student_index):
        # Assuming there are 30 students per branch, and each branch starts counting from 1
        return int(branch_code) * 100 + student_index

    def generate_email(self, student_index, branch_name):
        # Example: student1_civil@example.com
        return f'student{student_index}_{branch_name.lower().replace(" ", "_")}@example.com'
