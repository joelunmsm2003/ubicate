# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-21 13:43
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0019_auto_20190718_2223'),
    ]

    operations = [
        migrations.AddField(
            model_name='mensaje',
            name='estado',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='choose.Estado'),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 21, 8, 43, 17, 939557), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 21, 8, 43, 17, 937884), null=True),
        ),
    ]
