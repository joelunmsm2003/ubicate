# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-06-05 00:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0005_auto_20190603_1505'),
    ]

    operations = [
        migrations.AddField(
            model_name='centrosturistico',
            name='direccion',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]