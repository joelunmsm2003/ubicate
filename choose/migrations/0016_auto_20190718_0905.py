# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-18 14:05
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0015_auto_20190713_0901'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuarios',
            name='precio',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 18, 9, 5, 11, 262518), null=True),
        ),
    ]