# Generated by Django 5.0.2 on 2024-04-13 07:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Amenities', '0011_alter_product_availablility'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='product',
            name='availablility',
        ),
        migrations.AddField(
            model_name='product',
            name='stock',
            field=models.BooleanField(default=False),
        ),
    ]