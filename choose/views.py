#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.contrib.auth.models import Group, User
from jwt_auth.compat import json
from jwt_auth.mixins import JSONWebTokenAuthMixin
from django.template import RequestContext
import simplejson
from django.views.decorators.csrf import csrf_exempt
import xlrd
from django.core.mail import send_mail
from django.core.mail import EmailMultiAlternatives
from ipware.ip import get_real_ip,get_ip
from choose.models import *
from PIL import Image
from resizeimage import resizeimage
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate
import time
import twocheckout
import os
from datetime import datetime,timedelta,date
import os.path
import requests
import smtplib
from email.mime.text import MIMEText
from chooseba.settings import *
import datetime
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
import json
import pandas as pd

@csrf_exempt
def onesignalguarda(request):

	cli=Usuarios.objects.all()

	df = pd.read_csv('/var/www/html/clientes.csv')

	for i in cli:

		version_celular=i.version_celular

		modelo_celular =i.modelo_celular

		ip =i.ip
		
		#Abre para CLientes



		try:



			numero_notificacion = df[(df['device_os']==str(version_celular)) & (df['device_model']==modelo_celular) & (df['invalid_identifier']=='f') & (df['ip']==ip)]['id'].values[0]

			i.numero_notificacion=numero_notificacion

			
			i.save()

		except:

			pass






	c= simplejson.dumps('po')

	return HttpResponse(c, content_type="application/json")


@csrf_exempt
def guardadatosmovil(request):


		if request.method == 'POST':

			id=request.user.id

			modelo_celular = json.loads(request.body)['model']
			version_celular = json.loads(request.body)['tipo']
			uuid = json.loads(request.body)['uuid']


			print 'Guardando...',modelo_celular,version_celular

			if Usuarios.objects.filter(uuid=uuid):

				so = Usuarios.objects.get(uuid=uuid)
				so.modelo_celular = modelo_celular
				so.version_celular = version_celular
				so.ip= get_real_ip(request)
				so.fecha=datetime.datetime.today()
				so.save()



			c= simplejson.dumps({'u':'ok'})

			return HttpResponse(c, content_type="application/json")



def envianoti(numero_notificacion,contenido,clave,valor):



	header = {"Content-Type": "application/json; charset=utf-8","Authorization": "Basic ZDMwNDdmMmEtZGExNy00ODQ4LTk3MGItYjBkMzI3NGI3ZWMz"}
	payload = {"app_id": "f9ffbe5b-5c2d-49c8-911a-9de515621b4e","include_player_ids": [numero_notificacion],"contents": {"en": contenido},"data":{clave: valor},"small_icon":"ic_stat_onesignal_default","large_icon":"http://xiencias.com/ubica.png"}
	req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))

	return req



def ValuesQuerySetToDict(vqs):

    return [item for item in vqs]


@csrf_exempt
def usuarios(request):


	if request.method == 'GET':

		_users=Usuarios.objects.all().exclude(lat__isnull=True).exclude(nombre__isnull=True).values('id','lat','lng','iconData','ocupacion','ocupacion__icon','address','nombre','foto','telefono','descripcion','numero_cuenta','edad','sexo__nombre','ocupacion__nombre','precio','alias','publicidad')

		for u in range(len(_users)):

			_users[u]['position'] = {'lat':_users[u]['lat'] ,'lng': _users[u]['lng']}
			
			_users[u]['ocupacion__icon']='./assets/imgs/manager.png'

			_users[u]['icon'] = {'url':_users[u]['ocupacion__icon'],'scaledSize': 'new google.maps.Size(50, 50)'}


		c= simplejson.dumps(ValuesQuerySetToDict(_users))

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def mensajes(request,uuid):

	if request.method == 'GET':




		destino=Usuarios.objects.get(uuid=uuid).id

		_m=Mensaje.objects.filter(destino_id=destino).exclude(eliminado=1).values('id','descripcion','archivo','texto','numero_cuenta','origen','origen__nombre','origen__sexo__nombre','precio','formapago__nombre','archivo','destino__nombre','estado__nombre').order_by('-id')[0:5]

		_m1=Mensaje.objects.filter(origen_id=destino).exclude(eliminado=1).values('id','descripcion','archivo','texto','numero_cuenta','origen','origen__nombre','origen__sexo__nombre','precio','formapago__nombre','archivo','destino__nombre','estado__nombre').order_by('-id')[0:5]


		c= simplejson.dumps(ValuesQuerySetToDict(_m)+ValuesQuerySetToDict(_m1))

		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def updatealias(request):

	if request.method == 'POST':

		print json.loads(request.body)


		alias =json.loads(request.body)['info']

		uuid = json.loads(request.body)['uuid']

		print 'nombre',alias

		try:
		

			_u =Usuarios.objects.get(uuid=uuid)
			_u.publicidadcompartir = alias
			_u.save()

		except:

			pass

		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def listaintercambio(request,uuid):

	if request.method == 'GET':


		origen=Usuarios.objects.get(uuid=uuid).id

		_m=Intercambio.objects.filter(user_id=origen).exclude(eliminado=1).values('id','ofrezco__nombre','deseo__nombre').order_by('-id')

	
		c= simplejson.dumps(ValuesQuerySetToDict(_m))

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def buscaintercambio(request,uuid,intercambio):

	if request.method == 'GET':


		inter= Intercambio.objects.get(id=intercambio)

		deseo = inter.deseo.id

		ofrezco = inter.ofrezco.id

		print 'deseo-ogrezco..',deseo,ofrezco

		_inter = Intercambio.objects.filter(deseo_id=ofrezco,ofrezco_id=deseo).exclude(estado_id=2)

		print 'Encontrados...',_inter

		lista =[]

		for i in _inter:

			lista.insert(1,i.user.id)

		_users=Usuarios.objects.filter(id__in=lista).values('id','lat','lng','iconData','ocupacion','ocupacion__icon','address','nombre','foto','telefono','descripcion','numero_cuenta','edad','sexo__nombre','ocupacion__nombre','precio')

		for u in range(len(_users)):

			_users[u]['position'] = {'lat':_users[u]['lat'] ,'lng': _users[u]['lng']}

			if _users[u]['ocupacion__icon']==None:

				_users[u]['ocupacion__icon']='./assets/imgs/worker.png'

			_users[u]['icon'] = {'url':_users[u]['ocupacion__icon'],'scaledSize': 'new google.maps.Size(50, 50)'}


		c= simplejson.dumps(ValuesQuerySetToDict(_users))

		return HttpResponse(c, content_type="application/json")




@csrf_exempt
def guardaintercambio(request,uuid):

	if request.method == 'POST':

		deseo = json.loads(request.body)['deseo']

		ofrezco = json.loads(request.body)['ofrezco']

		user_id = Usuarios.objects.get(uuid=uuid).id

		Intercambio(user_id=user_id,deseo_id=deseo,ofrezco_id=ofrezco).save()

		_id = Intercambio.objects.all().values('id').order_by('-id')[0]['id']

		c= simplejson.dumps(_id)

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def profesiones(request):

	if request.method == 'GET':


		_m=Ocupacion.objects.all().values('id','nombre','icon','categoria').order_by('nombre')

		c= simplejson.dumps(ValuesQuerySetToDict(_m))

		return HttpResponse(c, content_type="application/json")

@csrf_exempt
def actualizaintercambio(request,id,estado):

	if request.method == 'GET':

		_m=Intercambio.objects.filter(id=id).update(estado_id=2)

		c= simplejson.dumps('Ok')

		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def productoservicios(request):

	if request.method == 'GET':

		_m=Productoservicio.objects.all().values('id','nombre','icon','categoria').order_by('nombre')

		c= simplejson.dumps(ValuesQuerySetToDict(_m))

		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def recibesolicitud(request,estado,mensaje):

	if request.method == 'GET':

		_m = Mensaje.objects.get(id=mensaje)

		_m.estado_id=estado

		numero_notificacion = Usuarios.objects.get(id=_m.origen.id).numero_notificacion

		if int(estado)==3:

			envianoti(numero_notificacion,'Tu solictud fue atendida','acepta',mensaje)

		if int(estado)==4:

			envianoti(numero_notificacion,'Tu solictud fue rechazada','acepta',mensaje)

		if int(estado)==5:

			envianoti(numero_notificacion,'Trabajo Finalizado, Cuantas estrellas le das','acepta',mensaje)



		_m.save()




		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")

@csrf_exempt
def califica(request,estrella,mensaje):

	if request.method == 'GET':

		_m = Mensaje.objects.get(id=mensaje)

		_m.estrella=estrella

		_m.estado_id=6


		_m.save()

		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")

@csrf_exempt
def miperfil(request,uuid):

	if request.method == 'GET':


		_m=Usuarios.objects.filter(uuid=uuid).values('id','lat','lng','iconData','ocupacion','ocupacion__icon','address','nombre','foto','edad','descripcion','sexo','telefono','numero_cuenta','precio','publicidad','publicidadcompartir')

		try:

			for i in range(len(_m)):

				_m[i]['publicidadcompartir'] = str(Usuarios.objects.get(id=_m[i]['publicidadcompartir']).publicidad)

				print 'Compartir..',_m[i]['publicidadcompartir']

		except:

			pass

		c= simplejson.dumps(ValuesQuerySetToDict(_m))

		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def robotintercambio(request):

	if request.method == 'GET':

		for i in Intercambio.objects.all().exclude(estado_id=2):

			user_1 = i.user.numero_notificacion
			
			_inter = Intercambio.objects.filter(deseo_id=i.ofrezco.id,ofrezco_id=i.deseo.id).exclude(estado_id=2)

			if _inter.count()>0:

				user_2 = _inter[0].user.numero_notificacion 

				print 'Encontramos intercambio'

				envianoti(user_1,'Encontramos un trueque '+i.deseo.nombre,'intercambio',i.id)

				#envianoti(user_2,'Encontramos un trueque para ti'+_inter[0].deseo.nombre,'intercambio',_inter.id)


		return HttpResponse(simplejson.dumps('Ok'), content_type="application/json")


@csrf_exempt
def registra(request,uuid):


	if request.method == 'GET':



		print 'REGISTRANDO.......'


		if Usuarios.objects.filter(uuid=uuid).count() == 0:

			Usuarios(uuid=uuid).save()

		_users=Usuarios.objects.filter(uuid=uuid).values('id','lat','lng','iconData','ocupacion','ocupacion__icon','address','name','foto')
		
		##for u in range(len(_users)):

			#_users[u]['position'] = {'lat':float(_users[u]['lat']) ,'lng': float(_users[u]['lng'])}
			#_users[u]['iconData'] = "./assets/imgs/Number-1-icon.png"


			#_users[u]['icon'] = {'url':_users[u]['ocupacion__icon'],'scaledSize': 'new google.maps.Size(50, 50)'}


		c= simplejson.dumps(ValuesQuerySetToDict(_users))


		return HttpResponse(c, content_type="application/json")

@csrf_exempt
def eliminamensaje(request,id):


	if request.method == 'GET':


		Mensaje.objects.filter(id=id).update(eliminado=1)

		c= simplejson.dumps('Ok')

		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def eliminaintercambio(request,id):

	if request.method == 'GET':

		Intercambio.objects.filter(id=id).update(eliminado=1)

		c= simplejson.dumps('Ok')

		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def actualiza(request,uuid):


	if request.method == 'POST':


		data = json.loads(request.body)


		print 'actualiza..',data

		if Usuarios.objects.filter(uuid=uuid).count() >0 :

			_u=Usuarios.objects.get(uuid=uuid)
			_u.lat=data['position']['lat']
			_u.lng=data['position']['lng']
			_u.modelo_celular=data['model']

			_u.version_celular=data['tipo']
			_u.ip= get_real_ip(request)
			_u.save()


		c= simplejson.dumps('ok')


		return HttpResponse(c, content_type="application/json")


@csrf_exempt
def guardaarchivo(request):


	if request.method == 'POST':

		_archivo=''

		for f in request.FILES:

			if f=='foto':

				_archivo = request.FILES['foto']

		
		_id = Mensaje.objects.all().values('id').order_by('-id')[0]['id']

		_u=Mensaje.objects.get(id=_id)

		_u.archivo=_archivo



		_u.save()


		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")

@csrf_exempt
def guardapublicidad(request,uuid):


	if request.method == 'POST':

		_archivo=''

		for f in request.FILES:

			if f=='foto':

				_archivo = request.FILES['foto']

		

		_u=Usuarios.objects.get(uuid=uuid)

		_u.publicidad=_archivo

		_u.save()


		c= simplejson.dumps('ok')

		return HttpResponse(c, content_type="application/json")


def sacaiduser(uuid):

	try:

		return Usuarios.objects.get(uuid=uuid).id

	except:

		pass

@csrf_exempt
def guardamensaje(request,uuid):


	if request.method == 'POST':

		data = json.loads(request.body)

		destino=''

		descripcion=''

		precio=''

		for d in data:

			if d=='precio':

				precio=data['precio']

			if d=='descripcion':

				descripcion=data['descripcion']

			if d=='destino':

				destino=data['destino']

				numero_notificacion_destino = Usuarios.objects.get(id=destino).numero_notificacion

		if Usuarios.objects.filter(uuid=uuid).count() >0 :

			Mensaje(origen_id=sacaiduser(uuid),destino_id=destino,descripcion=descripcion,precio=precio,estado_id=1).save()

			try:

				_men = Mensaje.objects.all().values('id').order_by('-id')[0]['id']

				envianoti(numero_notificacion_destino,'Tienes una nueva solictud de trabajo','estado',_men)

			except:

				pass


		c= simplejson.dumps('ok')


		return HttpResponse(c, content_type="application/json")



@csrf_exempt
def actualizaperfil(request,uuid):


	if request.method == 'POST':

		print  'data.....',json.loads(request.body)

		data = json.loads(request.body)
		

		if Usuarios.objects.filter(uuid=uuid).count() >0 :

			_u=Usuarios.objects.get(uuid=uuid)

			for d in data:

				if d=='ocupacion': _u.ocupacion_id=data['ocupacion']
				if d=='numero_cuenta': _u.numero_cuenta=data['numero_cuenta']
				if d=='descripcion': _u.descripcion=data['descripcion']
				if d=='edad': _u.edad=data['edad']
				if d=='nombre': _u.nombre=data['nombre']
				if d=='sexo': _u.sexo_id=data['sexo']
				if d=='telefono': _u.telefono=data['telefono']
				if d=='precio': _u.precio=data['precio']

				try:
					_u.name=Usuarios.objects.get(uuid=uuid).ocupacion.nombre
					_u.address=Usuarios.objects.get(uuid=uuid).nombre
				except:
					pass

				_u.save()






		c= simplejson.dumps('ok')


		return HttpResponse(c, content_type="application/json")



