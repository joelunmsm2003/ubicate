# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-02 03:42
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0005_auto_20190626_2242'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuarios',
            name='uuid',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 1, 22, 42, 15, 571130), null=True),
        ),
    ]
