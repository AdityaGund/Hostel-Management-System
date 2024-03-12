from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shortlisting', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='application',
            old_name='application_no',
            new_name='application_id',
        ),
    ]
