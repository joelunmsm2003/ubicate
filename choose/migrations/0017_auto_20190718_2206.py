# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-19 03:06
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0016_auto_20190718_0905'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuarios',
            name='modelo_celular',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='usuarios',
            name='numero_notificacion',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='usuarios',
            name='version_celular',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 18, 22, 6, 49, 580914), null=True),
        ),
    ]