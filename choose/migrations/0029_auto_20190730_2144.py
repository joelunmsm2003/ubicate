# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-07-31 02:44
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0028_auto_20190730_1255'),
    ]

    operations = [
        migrations.CreateModel(
            name='Productoservicio',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
                ('icon', models.CharField(blank=True, max_length=1000, null=True)),
                ('categoria', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'verbose_name': 'Productos Servicio Intercambio',
                'managed': True,
            },
        ),
        migrations.AlterModelOptions(
            name='ocupacion',
            options={'managed': True, 'verbose_name': 'Profesion'},
        ),
        migrations.RemoveField(
            model_name='ocupacion',
            name='intercambio',
        ),
        migrations.AlterField(
            model_name='intercambio',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 21, 44, 1, 654477), null=True),
        ),
        migrations.AlterField(
            model_name='mensaje',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 21, 44, 1, 653338), null=True),
        ),
        migrations.AlterField(
            model_name='usuarios',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 7, 30, 21, 44, 1, 647543), null=True),
        ),
    ]
