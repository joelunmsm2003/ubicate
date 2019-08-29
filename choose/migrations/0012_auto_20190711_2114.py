# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-12 02:14
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0011_auto_20190711_2109'),
    ]

    operations = [
        migrations.AddField(
            model_name='mensaje',
            name='formapago',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='formapago', to='choose.Formapago'),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 11, 21, 14, 29, 377151), null=True),
        ),
    ]
