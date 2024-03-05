from django.core.management.base import BaseCommand
from registration.models import creating_table, data

class Command(BaseCommand):
    help = 'Populates the database with initial data'

    def handle(self, *args, **options):
        creating_table(data)
        self.stdout.write(self.style.SUCCESS('Successfully populated data'))
    