# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-08-01 03:22
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0032_auto_20190730_2144'),
    ]

    operations = [
        migrations.AddField(
            model_name='usuarios',
            name='alias',
            field=models.CharField(blank=True, max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='intercambio',
            name='deseo',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='interdeseo', to='choose.Productoservicio'),
        ),
        migrations.AlterField(
            model_name='intercambio',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 31, 22, 22, 16, 106066), null=True),
        ),
        migrations.AlterField(
            model_name='intercambio',
            name='ofrezco',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='interofrezco', to='choose.Productoservicio'),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 31, 22, 22, 16, 104981), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 31, 22, 22, 16, 103397), null=True),
        ),
    ]
