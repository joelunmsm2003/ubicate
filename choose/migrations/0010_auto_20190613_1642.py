# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-06-13 21:42
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0009_auto_20190613_1642'),
    ]

    operations = [


        migrations.AlterField(
            model_name='hotel',
            name='description',
            field=models.CharField(blank=True, max_length=10000, null=True),
        ),
        migrations.AlterField(
            model_name='hotel',
            name='description_es',
            field=models.CharField(blank=True, max_length=10000, null=True),
        ),
    ]