# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-26 23:10
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0022_auto_20190726_1810'),
    ]

    operations = [
        migrations.AlterField(
            model_name='intercambio',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 26, 18, 10, 31, 579114), null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 26, 18, 10, 31, 577994), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 26, 18, 10, 31, 576314), null=True),
        ),
    ]
