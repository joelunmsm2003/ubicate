# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-31 02:44
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0030_auto_20190730_2144'),
    ]

    operations = [
        migrations.AlterField(
            model_name='intercambio',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 21, 44, 15, 599017), null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 21, 44, 15, 597924), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 21, 44, 15, 596281), null=True),
        ),
    ]
