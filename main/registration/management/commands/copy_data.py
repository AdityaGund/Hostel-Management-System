# main/management/commands/copy_data.py

from django.core.management.base import BaseCommand
from registration.models import CivilEngineering, ElectricalEngineering, ComputerEngineering, InstrumentationEngineering, ManfacturingEngineering, MechanicalEngineering, FirstYear

class Command(BaseCommand):
    help = 'Copy data from existing models to the FirstYear model'

    def handle(self, *args, **kwargs):
        for model in [CivilEngineering, ElectricalEngineering, ComputerEngineering, InstrumentationEngineering, ManfacturingEngineering, MechanicalEngineering]:
            model_name = model.__name__
            for instance in model.objects.all():
                first_year_instance = FirstYear(
                    user=instance.user,
                    rank=instance.rank,
                    application_id=instance.application_id,
                    email=instance.email,
                    name=instance.name,
                    percentile=instance.percentile,
                    verified=instance.verified,
                    selected=instance.selected,
                    branch=model_name
                )
                first_year_instance.save()

        self.stdout.write(self.style.SUCCESS('Data copied successfully to FirstYear model'))
