# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-06-26 03:49
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 6, 25, 22, 49, 10, 306318), null=True),
        ),
    ]
