# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-08-01 04:41
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0035_auto_20190731_2222'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuarios',
            name='publicidad',
            field=models.FileField(blank=True, null=True, upload_to='static'),
        ),
        migrations.AlterField(
            model_name='intercambio',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 31, 23, 41, 23, 207774), null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 31, 23, 41, 23, 206605), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 31, 23, 41, 23, 204865), null=True),
        ),
    ]
