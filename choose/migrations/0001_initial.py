# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2019-06-03 17:40
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AccountType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'account_type',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Amenity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('name_en', models.CharField(max_length=100)),
                ('caption', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'amenity',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AmenityHotel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'amenity_hotel',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AuthUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128)),
                ('last_login', models.DateTimeField(blank=True, null=True)),
                ('is_superuser', models.IntegerField()),
                ('username', models.CharField(max_length=30, unique=True)),
                ('first_name', models.CharField(max_length=30)),
                ('last_name', models.CharField(max_length=30)),
                ('email', models.CharField(max_length=254)),
                ('is_staff', models.IntegerField()),
                ('is_active', models.IntegerField()),
                ('date_joined', models.DateTimeField()),
                ('phone', models.IntegerField(blank=True, null=True)),
                ('seller', models.IntegerField(blank=True, null=True)),
                ('pais', models.CharField(blank=True, max_length=254, null=True)),
                ('permit_noti', models.IntegerField(blank=True, null=True)),
                ('cuenta', models.IntegerField(blank=True, null=True)),
                ('email_noti', models.CharField(blank=True, max_length=254, null=True)),
                ('lan', models.CharField(blank=True, max_length=254, null=True)),
                ('card_holder_name', models.CharField(blank=True, max_length=254, null=True)),
                ('number_zip', models.CharField(blank=True, max_length=254, null=True)),
                ('address_1', models.CharField(blank=True, max_length=254, null=True)),
                ('address_2', models.CharField(blank=True, max_length=254, null=True)),
                ('phone_extension', models.CharField(blank=True, max_length=254, null=True)),
                ('purchase_step', models.CharField(blank=True, max_length=254, null=True)),
            ],
            options={
                'db_table': 'auth_user',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ChooseTemplate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hotel', models.IntegerField(blank=True, null=True)),
                ('template', models.IntegerField(blank=True, null=True)),
                ('precio', models.IntegerField(blank=True, null=True)),
                ('extrasingle', models.IntegerField(blank=True, null=True)),
                ('doublesingle', models.IntegerField(blank=True, null=True)),
                ('max_occupancy', models.IntegerField(blank=True, null=True)),
                ('adults', models.IntegerField(blank=True, null=True)),
                ('childrens', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'choose_template',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='City',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('caption', models.CharField(blank=True, max_length=100, null=True)),
                ('name_en', models.CharField(blank=True, max_length=255, null=True)),
                ('thumbail', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'city',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ExtraBed',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.CharField(blank=True, max_length=100, null=True, unique=True)),
                ('child_occupancy', models.CharField(blank=True, max_length=100, null=True)),
                ('adult_occupancy', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'extra_bed',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ExtrabedRoomtemplate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'extrabed_roomtemplate',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Hotel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
                ('star', models.IntegerField(blank=True, null=True)),
                ('description', models.CharField(blank=True, max_length=255, null=True)),
                ('description_es', models.CharField(blank=True, max_length=255, null=True)),
                ('tripadvisor', models.IntegerField(blank=True, null=True)),
                ('account_type', models.IntegerField(blank=True, null=True)),
                ('address', models.CharField(blank=True, max_length=1000, null=True)),
                ('account_number', models.IntegerField(blank=True, null=True)),
                ('hold_limit', models.IntegerField(blank=True, null=True)),
                ('price', models.IntegerField(blank=True, null=True)),
                ('featured', models.IntegerField(blank=True, null=True)),
                ('later', models.IntegerField(blank=True, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
                ('politics', models.CharField(blank=True, max_length=2000, null=True)),
                ('politics_es', models.CharField(blank=True, max_length=2000, null=True)),
                ('subscrito', models.NullBooleanField(default=0)),
                ('fexpiracion', models.DateTimeField(blank=True, null=True)),
                ('iniciofsuscripcion', models.DateTimeField(blank=True, null=True)),
                ('calle', models.CharField(blank=True, max_length=1000, null=True)),
                ('nlote', models.CharField(blank=True, max_length=1000, null=True)),
                ('district', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'hotel',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='HotelRoomtemplate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('precio', models.IntegerField(blank=True, null=True)),
                ('extrasingle', models.IntegerField(blank=True, null=True)),
                ('extradouble', models.IntegerField(blank=True, null=True)),
                ('max_occupancy', models.IntegerField(blank=True, null=True)),
                ('childrens', models.IntegerField(blank=True, null=True)),
                ('adults', models.IntegerField(blank=True, null=True)),
                ('privatebathrom', models.IntegerField(blank=True, null=True)),
                ('activate', models.IntegerField(blank=True, null=True)),
                ('description', models.CharField(blank=True, max_length=255, null=True)),
                ('description_es', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'hotel_roomtemplate',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Interest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('name_en', models.CharField(max_length=100)),
                ('name_fr', models.CharField(max_length=100)),
                ('searchable', models.CharField(blank=True, max_length=100, null=True)),
                ('caption', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'interest',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InterestHotel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'interest_hotel',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Notifications',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(blank=True, null=True)),
                ('description', models.CharField(blank=True, max_length=10000, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'notifications',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(blank=True, null=True)),
                ('type', models.IntegerField(blank=True, null=True)),
                ('date', models.DateTimeField(default=datetime.datetime(2019, 6, 3, 12, 40, 49, 42205))),
                ('amount', models.CharField(blank=True, max_length=100, null=True)),
                ('transaction', models.CharField(blank=True, max_length=100, null=True)),
                ('response', models.CharField(blank=True, max_length=100, null=True)),
                ('responseCode', models.CharField(blank=True, max_length=100, null=True)),
                ('currency', models.CharField(blank=True, max_length=100, null=True)),
                ('fee', models.CharField(blank=True, max_length=100, null=True)),
                ('price', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'payment',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Paymentsub',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.IntegerField(blank=True, null=True)),
                ('datepay', models.DateTimeField(blank=True, null=True)),
                ('amount', models.CharField(blank=True, max_length=100, null=True)),
                ('transaction', models.CharField(blank=True, max_length=100, null=True)),
                ('response', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'payment_sub',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PaymentType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
                ('api_key', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'payment_type',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Photo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('url', models.CharField(blank=True, max_length=100, null=True)),
                ('date', models.DateTimeField(blank=True, null=True)),
                ('caption', models.FileField(upload_to='static')),
                ('hotels', models.IntegerField(blank=True, null=True)),
                ('visible', models.IntegerField(blank=True, null=True)),
                ('principal', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'photo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Reference',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'reference',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ReferenceHotel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'reference_hotel',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Region',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'region',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('traveler_name', models.CharField(blank=True, max_length=255, null=True)),
                ('traveler_email', models.CharField(blank=True, max_length=255, null=True)),
                ('traveler_mobile', models.IntegerField(blank=True, null=True)),
                ('checkindate', models.DateTimeField(blank=True, null=True)),
                ('checkoutdate', models.DateTimeField(blank=True, null=True)),
                ('codigo', models.CharField(blank=True, max_length=255, null=True)),
                ('attendant', models.CharField(blank=True, max_length=255, null=True)),
                ('dni', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'reservation',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ReservationStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'reservation_status',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
                ('description', models.CharField(blank=True, max_length=100, null=True)),
                ('price', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'room',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RoomReservation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('child_occupants', models.IntegerField(blank=True, null=True)),
                ('adult_occupants', models.IntegerField(blank=True, null=True)),
                ('extrasingle', models.CharField(blank=True, max_length=10000, null=True)),
                ('extradoble', models.CharField(blank=True, max_length=10000, null=True)),
                ('price', models.FloatField(blank=True, max_length=10000, null=True)),
            ],
            options={
                'db_table': 'room_reservation',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='RoomStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'room_status',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Roomtemplate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
                ('name_es', models.CharField(blank=True, max_length=100, null=True)),
                ('default_bed', models.IntegerField(blank=True, null=True)),
                ('total_occupancy_limit', models.IntegerField(blank=True, null=True)),
                ('adult_occupancy_limit', models.IntegerField(blank=True, null=True)),
                ('child_occupancy_limit', models.IntegerField(blank=True, null=True)),
                ('bath', models.IntegerField(blank=True, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'roomtemplate',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='System',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('server_smtp', models.CharField(blank=True, max_length=255, null=True)),
                ('user', models.CharField(blank=True, max_length=255, null=True)),
                ('password', models.CharField(blank=True, max_length=255, null=True)),
                ('port', models.CharField(blank=True, max_length=255, null=True)),
                ('api', models.CharField(blank=True, max_length=255, null=True)),
                ('utc', models.CharField(blank=True, max_length=255, null=True)),
            ],
            options={
                'db_table': 'system',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Tipo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'tipo',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TipoNotifications',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('body_es', models.CharField(blank=True, max_length=10000, null=True)),
                ('body_en', models.CharField(blank=True, max_length=10000, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
                ('subject_en', models.CharField(blank=True, max_length=10000, null=True)),
                ('subject_es', models.CharField(blank=True, max_length=10000, null=True)),
            ],
            options={
                'db_table': 'tipo_notification',
                'managed': False,
            },
        ),
    ]