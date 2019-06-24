# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-06-03 18:47
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('choose', '0003_auto_20190603_1241'),
    ]

    operations = [
        migrations.CreateModel(
            name='Centrosturistico',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('caption', models.CharField(blank=True, max_length=100, null=True)),
                ('name_en', models.CharField(blank=True, max_length=255, null=True)),
                ('thumbail', models.CharField(blank=True, max_length=100, null=True)),
                ('latitud', models.CharField(blank=True, max_length=100, null=True)),
                ('longitud', models.CharField(blank=True, max_length=100, null=True)),
                ('city', models.ForeignKey(blank=True, db_column='region', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='choose.City')),
                ('photo', models.ForeignKey(blank=True, db_column='photo', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='choose.Photo')),
            ],
            options={
                'db_table': 'centroturistico',
                'managed': True,
            },
        ),
        migrations.AlterModelOptions(
            name='reservation',
            options={'managed': False},
        ),
    ]
