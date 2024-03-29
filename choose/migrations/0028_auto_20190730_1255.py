# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-30 17:55
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0027_auto_20190730_1138'),
    ]

    operations = [
        migrations.AddField(
            model_name='ocupacion',
            name='intercambio',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='intercambio',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 12, 55, 49, 582902), null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 12, 55, 49, 581789), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 12, 55, 49, 580127), null=True),
        ),
    ]
