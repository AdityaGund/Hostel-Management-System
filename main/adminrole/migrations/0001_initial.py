# Generated by Django 3.2.18 on 2024-04-11 05:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CheckInOut',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mis', models.IntegerField()),
                ('year', models.CharField(max_length=100)),
                ('reason', models.CharField(max_length=100)),
                ('check_in_time', models.DateTimeField(null=True)),
                ('check_out_time', models.DateTimeField(null=True)),
            ],
        ),
    ]