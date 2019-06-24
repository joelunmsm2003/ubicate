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

def ValuesQuerySetToDict(vqs):

    return [item for item in vqs]

@csrf_exempt
def recuperapass(request,email):


	r = requests.post(HOST+'/send_simple_message/', data=json.dumps({"subject": u"Recuperacion de contraseña","message":u'Haz click aqui para cambiar tu contraseña https://inncomun.com:9000/cambiapassword/'+email,"receptor":email}))
	
	print r.status_code

	data_json = simplejson.dumps('Send...')

	return HttpResponse(data_json, content_type="application/json")

class JSONResponse(HttpResponse):
    """
    An HttpResponse that renders its content into JSON.
    """
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

# Create your views here.

@csrf_exempt
def existphoto(request):

	if request.method == 'POST':

		ruta = json.loads(request.body)

		txt = 0

		for u in ruta:

			if u == 'url':

				path = '/home/joel/proyectos/chooseba/'+str(ruta['url'])

				if os.path.exists(path) == False:

					txt = 0

				else:

					txt = 1

		data_json = simplejson.dumps(txt)

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def photoroomtype(request):

	if request.method == 'POST':




		template = request.POST['template']

		hotel =request.POST['hotel']

		roomtemplate = request.POST['roomtype']

		caption = request.FILES['file']

		Photo(caption=caption).save()

		id_photo = Photo.objects.all().values('id').order_by('-id')[0]['id']

		caption = str(Photo.objects.get(id=id_photo).caption)

		caption_title = caption.split('.jpg')[0]

		caption_thumbail = caption_title+'_thumbail.jpg'

		caption_info = caption_title+'_info.jpg'

		fd_img = open(caption, 'r')

		img = Image.open(fd_img)

		width, height = img.size

		data_json = simplejson.dumps(width)

		if int(width)>8000:

			return HttpResponse(data_json, content_type="application/json")


		if int(width)<1024:

			return HttpResponse(data_json, content_type="application/json")

		else:

			img = resizeimage.resize_cover(img, [1024, 800])

			img.save(caption, img.format)
			fd_img.close()

			img = resizeimage.resize_cover(img, [760, 450])

			img.save(caption_info, img.format)
			fd_img.close()


			img = resizeimage.resize_cover(img, [370, 150])

			img.save(caption_thumbail, img.format)
			fd_img.close()
		
		hrt = HotelRoomtemplate.objects.filter(hotel_id=hotel,roomtemplate_id=roomtemplate).count()

		rt = Roomtemplate.objects.get(id=roomtemplate)
		
		
		if hrt == 0:

			HotelRoomtemplate(hotel_id=hotel,extrasingle =0,extradouble=0,privatebathrom=0,adults=rt.adult_occupancy_limit,childrens=rt.child_occupancy_limit,max_occupancy=rt.total_occupancy_limit,roomtemplate_id=roomtemplate,activate=1,photo_id=id_photo).save()

		else:



			tem = HotelRoomtemplate.objects.get(hotel_id=hotel,roomtemplate_id=roomtemplate)

			tem.photo_id = id_photo

			tem.save()





		data_json = simplejson.dumps(width)

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def categoryid(request):

	if request.method == 'PUT':

		data = json.loads(request.body)


		for d in data['info']:

			if d == 'name':

				name = data['info']['name']

			if d == 'name_en':

				name_en = data['info']['name_en']

			if d == 'id':

				id = data['info']['id']

			if d == 'caption':

				caption = data['info']['caption']


		category = data['info']['category']['label']

	
		if category == 'Interes':

			i = Interest.objects.get(id=id)
			i.name = name
			i.name_en = name_en
			i.caption = caption
			i.save()

		if category == 'Amenity':

			a = Amenity.objects.get(id=id)
			a.name = name
			a.name_en = name_en
			a.caption = caption
			a.save()

		if category == 'City':

			c = City.objects.get(id=id)
			c.name = name
			c.caption = caption
			c.save()

		data_json = simplejson.dumps('data')

		return HttpResponse(data_json, content_type="application/json")



@csrf_exempt
def category(request):


	if request.method == 'GET':

		data = []

		cities = City.objects.all().values('id','name','photo__url','photo__caption','caption')

		interests = Interest.objects.all().values('id','name','photo__url','photo__caption','name_en','caption')

		ammenity = Amenity.objects.all().values('id','name','photo__url','photo__caption','name_en','caption')

		for i in range(len(cities)):

			cities[i]['categoria'] = 'City'

			cities_dict = ValuesQuerySetToDict(cities)

		for i in range(len(interests)):

			interests[i]['categoria'] = 'Interes'

		for i in range(len(ammenity)):

			ammenity[i]['categoria'] = 'Amenity'

			ammenity_dict = ValuesQuerySetToDict(ammenity)



		interests_dict = ValuesQuerySetToDict(interests)

		data_dict = cities_dict + interests_dict +ammenity_dict

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")




	if request.method == 'POST':

		data = json.loads(request.body)


		photo = data['photo']

		id_photo = Photo.objects.all().values('id').order_by('-id')[0]['id']

		category = data['info']['category']['label']

		name = data['info']['name']

		name_en = data['info']['name_en']


		if category == 'Interes':

			Interest(name=name,name_en=name_en,photo_id=id_photo).save()

		if category == 'Amenity':

			Amenity(name=name,name_en=name_en,photo_id=id_photo).save()

		if category == 'City':

			City(name=name,name_en=name_en,photo_id=id_photo).save()

		


		data_json = simplejson.dumps('data')

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def icon(request):

    if request.method == 'POST':




        caption = request.FILES['file']

        Photo(caption=caption).save()

        data_json = simplejson.dumps('icon')

        return HttpResponse(data_json, content_type="application/json")



class Paycheckoutinline(JSONWebTokenAuthMixin, View):

	def post(self, request):

		pay = request.body.split('?')[1].split('&')

		procesado = pay[14].split('=')[1]

		sid = pay[2].split('=')[1]
		book = pay[5].split('=')[1]
		transaction = pay[12].split('=')[1]
		total = pay[14].split('=')[1]

		Payment(amount=total,transaction=transaction,response=str(request.body),reservation_id=book).save()

		id = request.user.id

		tipo = AuthUser.objects.get(id=id).type_user.name

		lan = AuthUser.objects.get(id=id).lan

		first_name = AuthUser.objects.get(id=id).first_name

		email = AuthUser.objects.get(id=id).email

		body = ""

		subject = ''



		if procesado=='Y':

			r = Reservation.objects.get(id=book)

			if r.hotel.status == 3 and tipo == 'User':

				email_owner = r.hotel.user.email

				link = HOST_FRONT + '/bookingadminid/'+str(r.hotel.id)+'/'+str(r.id)

				owner = r.hotel.user.first_name

				viajero = first_name

				r.status_id = 4

				tn = TipoNotifications.objects.get(id=7)

				if lan == 'es':

					body = tn.body_es

					subject = tn.subject_es

				if lan == 'en':

					body = tn.body_en

					subject = tn.subject_en

				body = body.replace("%traveler%",first_name).replace('%viajero%',viajero).replace('%link%',link).replace("%owner%",owner)

				Notifications(description=body,tipo_id=7,date=datetime.datetime.now(),hotel_id=r.hotel.id).save()

				requests.post(HOST+'/send_simple_message/', json={"message": body,"subject":subject,"receptor":email_owner})

				if tipo == 'User':

					r.user_id = id

					r.save()

		else:

			r = Reservation.objects.get(id=book)

			r.status_id = 3

			r.save()

			if tipo == 'User':

				r.user_id = id

				r.save()



 
		data_json = simplejson.dumps(book)

		return HttpResponse(data_json, content_type="application/json")


class Suscripcion(JSONWebTokenAuthMixin, View):

	def post(self,request):

		data = json.loads(request.body)


		id = request.user.id

		for d in data:

			if d == 'url':

				url =  json.loads(request.body)['url']

				pay = url.split('?')[1].split('&')

				tipo = pay[1].split('=')[1]

				procesado = pay[14].split('=')[1]

				total = pay[13].split('=')[1]

				transaction = pay[13].split('=')[1]

				hotel = pay[22].split('=')[1]

				hotel = Hotel.objects.get(id=hotel)

				user = hotel.user.id

				u =AuthUser.objects.get(id=user)

				body = ''

				subject = ''

				ua = AuthUser.objects.filter(type_user__name='Admin')

		 		u.cuenta = 3

		 		u.save()

		 		#Si pago entonces flag suscrito = 1

				hotel.subscrito = 1

				hotel.iniciofsuscripcion = datetime.datetime.now()

				hotel.save()

				link = HOST_FRONT+'/hotel/'+str(hotel.id)+'/'

				for ux in ua:

					tn = TipoNotifications.objects.get(id=2)

					lan = ux.lan

					if lan == 'es':

						body = tn.body_es

						subject = tn.subject_es

					if lan == 'en':

						body = tn.body_en

						subject = tn.subject_en

					body = body.replace("%hotel%",hotel.name).replace("%link%",link)

					Notifications(description=body,tipo_id=2,date=datetime.datetime.now(),hotel_id=hotel.id).save()

					requests.post(HOST+'/send_simple_message/', json={"message": body,"subject":subject,"receptor":ux.email})


				data = {'suscripcion':'OK'}

				data_json = simplejson.dumps(user)



				Paymentsub(amount=total,transaction=transaction,response=url,hotel_id=hotel.id,datepay=datetime.datetime.now()).save()


		users = AuthUser.objects.filter(type_user__name='Admin',permit_noti=1)


		return HttpResponse(data_json, content_type="application/json")



class Cancelsuscripcion(JSONWebTokenAuthMixin, View):

	def get(self, request,id_user):

		id = request.user.id

		if AuthUser.objects.get(id=id).type_user.name == 'Admin':

			id = id_user

		u =AuthUser.objects.get(id=id_user)

 		u.cuenta = 4


 		u.save()

 		ua = AuthUser.objects.filter(type_user__name='Admin')

		hotel = Hotel.objects.get(user_id=id)



		fmt = '%d %b'



		#finsuscripcion =

		year = hotel.iniciofsuscripcion.year

		mes = datetime.datetime.now().month



		day = hotel.iniciofsuscripcion.day

		if mes == 12:

			mes = 0
			year= year+1

		finsuscripcion = date(year, mes+1, day+1)


		hotel.subscrito = 0

		hotel.fexpiracion = finsuscripcion

		body = ''

		#pay = Paymentsub.objects.filter(hotel=hotel.id).order_by('-id')[0]

		#hotel.fexpiracion = pay.datepay+timedelta(days=30)

		hotel.save()

		link = HOST_FRONT+'/hotel/'+str(hotel.id)+'/'

		for ux in ua:

			tn = TipoNotifications.objects.get(id=4)

			lan = ux.lan

			if lan == 'es':

				body = tn.body_es

				subject = tn.subject_es

			if lan == 'en':

				body = tn.body_en

				subject = tn.subject_en

			body = body.replace("%hotel%",hotel.name).replace("%link%",link)

			Notifications(description=body,tipo_id=4,date=datetime.datetime.now(),hotel_id=hotel.id).save()

			requests.post(HOST+'/send_simple_message/', json={"message": body,"subject":subject,"receptor":ux.email})

		data = {'suscripcion':'KO'}

		data_json = simplejson.dumps(data)


		return HttpResponse(data_json, content_type="application/json")


class Activaremailadmin(JSONWebTokenAuthMixin, View):

	def get(self,request,id_user):

		id =request.user.id

		tipo = AuthUser.objects.get(id=id).type_user.name

		if AuthUser.objects.get(id=id).type_user.name == 'Admin':

			u =AuthUser.objects.get(id=id_user)

			if u.type_user.name =='Owner':
 				u.cuenta = 1
 			if u.type_user.name == 'User':
 				u.cuenta = 1

 			u.save()



		data_json = simplejson.dumps('activar')

		return HttpResponse(data_json, content_type="application/json")


class Eliminaphoto(JSONWebTokenAuthMixin, View):

	def get(self,request,id):

		Photo.objects.filter(id=id).update(visible=0)

		data_json = simplejson.dumps('ok')

		return HttpResponse(data_json, content_type="application/json")


class Deleteuser(JSONWebTokenAuthMixin, View):

	def get(self,request,id_user):

		id =request.user.id

		if AuthUser.objects.get(id=id).type_user.name == 'Admin':

			u =AuthUser.objects.get(id=id_user)
 			u.cuenta = 2
 			u.is_active = 0
 			u.save()


		data_json = simplejson.dumps('payment')

		return HttpResponse(data_json, content_type="application/json")



class UTC(JSONWebTokenAuthMixin, View):

	def get(self,request):

		s = System.objects.filter(id=1).values('utc')

		s = ValuesQuerySetToDict(s)

		data_json = simplejson.dumps(s)

		return HttpResponse(data_json, content_type="application/json")


	def post(self,request):

		data = json.loads(request.body)['utc']

		s = System.objects.get(id=1)
		s.utc= data['utc']
		s.save()


		data_json = simplejson.dumps('payment')

		return HttpResponse(data_json, content_type="application/json")



class Paysub(JSONWebTokenAuthMixin, View):

	def post(self, request):

		data = json.loads(request.body)

		id = data['user']['id']

		data_json = simplejson.dumps('No pay')


		#if Hotel.objects.filter(user_id=id):

		#	hotel = Hotel.objects.get(user_id=id)

		#	payment = Paymentsub.objects.filter(hotel_id=hotel.id).values('id','amount','transaction','response')

		#	fmt = '%d %b'

		#	for j in range(len(payment)):

		#		payment[j]['datepay'] = Paymentsub.objects.get(id=payment[j]['id']).datepay.strftime(fmt)
		#		payment[j]['datepay1'] = (Paymentsub.objects.get(id=payment[j]['id']).datepay + timedelta(days=30)).strftime(fmt)

		#	payment = ValuesQuerySetToDict(payment)

		#	data_json = simplejson.dumps(payment)

		

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def registroduenohotel(request):

	if request.method == 'POST':

		datos = json.loads(request.body)['datos']

		phone_number = datos['phone']

		first_name = datos['first_name']

		username = datos['username']

		password = 'rosa0000'

		try:

			u = User.objects.create_user(username, username, password)

			au=AuthUser.objects.get(id=u.id)

			au.first_name = first_name

			au.phone = phone_number

			au.type_user_id = 3

			au.cuenta = 0

			au.save()

			return HttpResponse(simplejson.dumps('ok'), content_type="application/json")

		except:


			au = AuthUser.objects.get(username=username)

			au.first_name = first_name

			au.phone = phone_number

			au.save()


			return HttpResponse(simplejson.dumps('Este email ya existe'), content_type="application/json")


class Registrohotel(JSONWebTokenAuthMixin, View):

	def post(self, request):

		datos = json.loads(request.body)

		print datos

		star = datos['star']['label']

		calle = datos['calle']

		nlote = datos['nlote']

		district = datos['district']

		city_name = datos['city']

		hotel = datos['name']

		address = str(calle) + ' ' + str(nlote) + ' '+ str(district)

		city_id = City.objects.get(name=city_name).id

		print 'cuantos',Hotel.objects.filter(user_id=request.user.id).count()

		if Hotel.objects.filter(user_id=request.user.id).count()==0:

			Hotel(name=hotel,star=star,address=address,calle=calle,nlote=nlote,district=district,city_id=city_id,user_id=request.user.id,status=1,fexpiracion='2025-12-12',subscrito=0,photo_id=1).save()

			h_id = Hotel.objects.all().values('id').order_by('-id')[0]['id']

			return HttpResponse(simplejson.dumps('Ok'), content_type="application/json")

		else:

			Hotel.objects.filter(user_id=request.user.id).update(name=hotel,star=star,address=address,calle=calle,nlote=nlote,district=district,city_id=city_id,user_id=request.user.id,status=1,fexpiracion='2025-12-12',subscrito=0,photo_id=1)

			return HttpResponse(simplejson.dumps('Ok'), content_type="application/json")








@csrf_exempt
def becomeowner(request):

	if request.method == 'POST':


		data = json.loads(request.body)

		users = AuthUser.objects.filter(type_user__name='Admin',permit_noti=1)

		tipo = ''

		for d in data:

			if d == 'url':

				url =  json.loads(request.body)['url']

				pay = url.split('?')[1].split('&')

				tipo = pay[1].split('=')[1]

				procesado = pay[14].split('=')[1]

				total = pay[13].split('=')[1]

				transaction = pay[13].split('=')[1]

				usuario = {'suscripcion':'OK'}

				data_json = simplejson.dumps(usuario)

				#Paymentsub(amount=total,transaction=transaction,response=url,datepay=datetime.datetime.now()).save()


			if d == 'datos' and tipo != 'Suscripcion' :

				datos = json.loads(request.body)['datos']

				phone_number = datos['phone_number']

				first_name = datos['first_name']

				username = datos['username']

				star = datos['star']['label']

				calle = datos['calle']

				nlote = datos['nlote']

				district = datos['district']

				city_name = datos['city']

				city_id = City.objects.get(name=city_name).id

				address = str(calle) + ' ' + str(nlote) + ' '+ str(district)

				password = datos['password']

				email =  username

				hotel = datos['hotel_name']	

				usuario = {'username':username,'password':password}

				data_json = simplejson.dumps(usuario)

				#if procesado == 'Y':

				u = User.objects.create_user(username, username, password)

				au=AuthUser.objects.get(id=u.id)

				au.first_name = first_name

				au.phone = phone_number

				au.type_user_id = 3

				au.cuenta = 0

				au.save()

				Hotel(name=hotel,star=star,address=address,calle=calle,nlote=nlote,district=district,city_id=city_id,user_id=u.id,status=1,fexpiracion='2025-12-12',subscrito=0,photo_id=1).save()

				h_id = Hotel.objects.all().values('id').order_by('-id')[0]['id']

				requests.post(HOST+'/send_simple_message/', data=json.dumps({"message": 'Bienvenido '+str(first_name)+' a Inncomun, para activar tu cuenta, haz click en el siguiente link  : ' + str(HOST) +'/activarcuenta/'+str(u.id) ,"subject":'Inncomun' ,"receptor":str(email)}))

				Notifications(user_id=u.id,description='Pay new owner',hotel_id=h_id,date=datetime.datetime.now()).save()

				#....
				os.system('mkdir static/'+str(h_id))

				os.system('mkdir static/'+str(h_id)+'/template')



		return HttpResponse(data_json, content_type="application/json")


	data_json = simplejson.dumps('data')

	return HttpResponse(data_json, content_type="application/json")



@csrf_exempt
def respuestapago(request):

	if request.method == 'POST':

		p =str(request.body).split(',')


		print 'RESPUESTA DE PAGO.......'

		for x in p:

			if 'merchantOrderId' in x :

				reservation = int(x.split(':')[1].replace('"',''))


			if 'responseCode' in x :

				responseCode = x.split(':')[1].replace('"','')

			if 'response' in x:

				response = x.split(':')[1]

			if 'transactionId' in x:

				transaction = x.split(':')[1].replace('"','')

			if 'total' in x:

				total = x.split(':')[1].replace('"','')

			if 'currencyCode' in x:

				currency = x.split(':')[1].replace('"','')


			if 'currencyCode' in x:

				currency = x.split(':')[1].replace('"','')

			if 'startupFee' in x:

				fee = x.split(':')[1].replace('"','')


			if 'price' in x:

				price = x.split(':')[1].replace('"','')
				










		Payment(price=price,fee=fee ,currency=currency,amount=total,transaction=transaction,response=response,responseCode=responseCode,reservation_id=reservation).save()

		re = Reservation.objects.get(id=reservation)
		re.status_id=4
		re.save()
		#{"key":"'{"validationErrors":null,"exception":null,"response":{"type":"AuthResponse","currencyCode":"USD","lineItems":[{"duration":"Forever","description":"","options":[],"price":"255","quantity":"1","recurrence":"4 Year","startupFee":"9.99","productId":"","tangible":"N","name":"Demo Item","type":"product"}],"transactionId":"9093749590740","billingAddr":{"addrLine1":"123 test blvd","addrLine2":null,"city":"columbus","zipCode":"43123","phoneNumber":"123456789","phoneExtension":null,"email":"example@2co.com","name":"testing tester","state":"Ohio","country":"USA"},"shippingAddr":{"addrLine1":null,"addrLine2":null,"city":null,"zipCode":null,"phoneNumber":null,"phoneExtension":null,"email":null,"name":null,"state":null,"country":null},"merchantOrderId":"96","orderNumber":"9093749590731","recurrentInstallmentId":null,"responseMsg":"Successfully authorized the provided credit card","responseCode":"APPROVED","total":"264.99","errors":null}}'"}

		

		data= {'hotel':re.hotel.id,'booking':reservation}

		data_json = simplejson.dumps(data)

		return HttpResponse(data_json, content_type="application/json")




@csrf_exempt
def doscheckoutcard(request):

	if request.method == 'POST':


                

		pay = json.loads(request.body)['pay']
		book = json.loads(request.body)['book']
		mount = json.loads(request.body)['mount']
                
		#mount = mount*96/float(100)

		#mount = mount-mount*9.99/60


		os.system('./pago.sh '+pay+' '+str(mount)+' '+str(book))

		re = Reservation.objects.get(id=book)

		

                data= {'user':re.user.id,'hotel':re.hotel.id,'booking':re.id}

		data_json = simplejson.dumps(data)


		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def notification(request):


	if request.method == 'GET':

		n = Notifications.objects.all().values('id','user__type_user__name','description','hotel','hotel__name','user__first_name','user','reservation','reservation__hotel','reservation__hotel__name','status','tipo').order_by('-id')

		fmt = '%d %B'

		for j in range(len(n)):

			if Notifications.objects.get(id=n[j]['id']).date:

				n[j]['date'] = Notifications.objects.get(id=n[j]['id']).date.strftime(fmt)


		data_dict = ValuesQuerySetToDict(n)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def vistonotification(request,id):


	if request.method == 'GET':

		n = Notifications.objects.get(id=id)

		n.status = 1

		n.save()

		data_dict = ValuesQuerySetToDict('n')

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")


class Resend(JSONWebTokenAuthMixin, View):

    def get(self,request,id_user):

		u = AuthUser.objects.get(id=id_user)

		print 'Enviando.... QUEEEEE?????',HOST

		requests.post(HOST+'/send_simple_message/', data=simplejson.dumps({"message": 'Bienvenido '+str(u.first_name)+' a Inncomun, para activar tu cuenta, haz click en el siguiente link  : ' + str(HOST) +'/activarcuenta/'+str(u.id) ,"subject":'Inncomun' ,"receptor":str(u.email)}))

		data_json = simplejson.dumps('data_dict')

		return HttpResponse(data_json, content_type="application/json")


class DeletePhoto(JSONWebTokenAuthMixin, View):

    def get(self,request,id_photo,id_hotel):

		p =Photo.objects.get(id=id_photo)
		
		hotel_id = p.hotels

		hotels = Hotel.objects.filter(photo_id=id_photo)

		for h in hotels:

			h.photo_id = None
			
			h.save()

		users = AuthUser.objects.filter(photo_id=id_photo)

		for u in users:

			u.photo_id = None

			u.save()

		rooms = HotelRoomtemplate.objects.filter(photo_id=id_photo)

		for r in rooms:

			r.photo_id = None

			r.save()
			
		
		
		p.delete()

		data_json = simplejson.dumps('data_dict')

		return HttpResponse(data_json, content_type="application/json")


class Publish(JSONWebTokenAuthMixin, View):

    def get(self,request,id_hotel):

		id = request.user.id

		u = AuthUser.objects.get(id=id)

		u_admin = AuthUser.objects.filter(type_user__name='Admin')

		for ua in u_admin:

			lan = ua.lan

			first_name = u.first_name

			email = u.email

			body = ''

			h = Hotel.objects.get(id=id_hotel)

			h.status= 2

			h.save()

			subject = ''

			link = HOST_FRONT+'/hotel/'+str(id_hotel)+'/'

			tn = TipoNotifications.objects.get(id=3)

			if lan == 'es':

				body = tn.body_es

				subject = tn.subject_es

			if lan == 'en':

				body = tn.body_en

				subject = tn.subject_en

			body = body.replace("%hotel%",h.name).replace("%link%",link)

			Notifications(description=body,tipo_id=3,date=datetime.datetime.now(),hotel_id=id_hotel).save()

			requests.post(HOST+'/send_simple_message/', json={"message": body,"subject":subject,"receptor":ua.email})

		data_json = simplejson.dumps('data_dict')

		return HttpResponse(data_json, content_type="application/json")


class Draft(JSONWebTokenAuthMixin, View):

    def get(self,request,id_hotel,description):

	if request.method == 'GET':

		id =request.user.id

		user = AuthUser.objects.get(id=id)

		lan = user.lan

		email = user.email

		first_name = user.first_name

		h = Hotel.objects.get(id=id_hotel)

		h.status = 1

		h.save()

		tn = TipoNotifications.objects.get(id=6)

		if lan == 'es':

			body = tn.body_es

			subject = tn.subject_es

		if lan == 'en':

			body = tn.body_en

			subject = tn.subject_en


		body = body.replace("%traveler%",first_name)

		Notifications(description=body,tipo_id=6,date=datetime.datetime.now()).save()

		requests.post(HOST+'/send_simple_message/', json={"message": body,"subject":subject,"receptor":email})

		data_json = simplejson.dumps('data_dict')

		return HttpResponse(data_json, content_type="application/json")


class Approve(JSONWebTokenAuthMixin, View):

    def get(self,request,id_hotel):

	if request.method == 'GET':

		id = request.user.id

		h = Hotel.objects.get(id=id_hotel)

		h.status = 3

		h.save()

		h = Hotel.objects.get(id=id_hotel)

		lan = 'es'

		email = h.user.email

		first_name = h.user.first_name

		tn = TipoNotifications.objects.get(id=6)

		if lan == 'es':

			body = tn.body_es

			subject = tn.subject_es


		body = body.replace("%owner%",first_name).replace("%status%","Aprobado").replace("%hotel%",h.name)

		Notifications(description=body,tipo_id=6,hotel_id=id_hotel,date=datetime.datetime.now()).save()

		requests.post(HOST+'/send_simple_message/', json={"message": body,"subject":subject,"receptor":email})

		data_json = simplejson.dumps('data_dict')

		return HttpResponse(data_json, content_type="application/json")



@csrf_exempt
def smtp(request):

    if request.method == 'POST':


    	smtp = System.objects.get(id=1)

    	info = json.loads(request.body)['info']


    	for d in info:

    		if d=='port':

    			port = info['port']
    			smtp.port = port

    		if d=='password':

    			password=info['password']
    			smtp.password = password

    		if d=='user':

    			user =info['user']
    			smtp.user = user

    		if d=='server_smtp':

    			server = info['server_smtp']

    			smtp.server_smtp = server


    		if d=='api':

    			api = info['api']
    			smtp.api = api


    	
    	
    	
    	
    	
    	smtp.save()

    	data_json = simplejson.dumps('Updated')

        return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def viewsmtp(request):

    if request.method == 'GET':
		
		city=City.objects.all()

		for c in city:

			caption_title = c.caption.split('.jpg')[0]

			caption_info = caption_title+'_thumbail.jpg'

			c.thumbail =caption_info

			c.save()

			fd_img = open('/var/www/html/cbi-fe/dist/'+c.caption, 'r')

			img = Image.open(fd_img)

			img = resizeimage.resize_cover(img, [300, 300])

			img.save('/var/www/html/cbi-fe/dist/'+caption_info, img.format)

			fd_img.close()

		n = System.objects.filter(id=1).values('id','port','api','server_smtp','user','password')

		data_dict = ValuesQuerySetToDict(n)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")




@csrf_exempt
def send_simple_message(request):

	smtp = System.objects.get(id=1)

	if request.method == 'POST':


		print 'Enviando correo...',json.loads(request.body)



		text_content = json.loads(request.body)['message']
		receptor = json.loads(request.body)['receptor']
		subject = json.loads(request.body)['subject']



		user = smtp.user
		password = smtp.password
		domain = smtp.server_smtp
		port = smtp.port
		subject = subject
		emisor = 'Inncomun <Inncomun@inncomun.com>'
		receptor = receptor



		msg = EmailMultiAlternatives(subject, text_content, emisor, [receptor])

		msg.send()





		# msg = MIMEText(message)
		# msg['Subject'] = subject
		# msg['From']    = emisor
		# msg['To']      = receptor

		# s = smtplib.SMTP('smtp.mailgun.org', str(port))

		# s.login(user,password)
		# s.sendmail(user, msg['To'], msg.as_string())
		# s.quit()

		data_json = simplejson.dumps('Send...')

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def enviaemailprueba(request):


	r = requests.post(HOST+'/send_simple_message/', data=json.dumps({"message": "Holaaaaa","subject":'Es un tulun subjects',"receptor":"joelunmsm@gmail.com"}))
	
	print r.status_code

	data_json = simplejson.dumps('Send...')

	return HttpResponse(data_json, content_type="application/json")





@csrf_exempt
def prueba(request):



	booking = request.POST['merchantorderid']
	li_0_price = request.POST['li_0_price']
	currency_code = request.POST['currency_code']
	total = request.POST['total']
	transaction = request.POST['invoice_id']
	response = request.POST['credit_card_processed']


	Payment(price=li_0_price ,currency=currency_code,amount=total,transaction=transaction,response=response,reservation_id=booking).save()

	re = Reservation.objects.get(id=booking)
	re.status_id=4
	re.save()


	reserva = Reservation.objects.get(id=booking)
	id= reserva.user.id



	print 'ID...',id


	#r = requests.post(HOST+'/send_simple_message/', data=json.dumps({"message": "Holaaaaa","subject":'Es un tulun subjects',"receptor":"joelunmsm@gmail.com"}))
	
	#print r.status_code

	data_json = simplejson.dumps('Send...')

	return render(request, 'cuenta.html',{'id':id,'host_front':'https://inncomun.com/cbi-fe/dist/'})


@csrf_exempt
def pagos(request):


	if request.method == 'POST':


		print 'hahaha',request.POST

		data_json = simplejson.dumps('Send...')

		return HttpResponse(data_json, content_type="application/json")



@csrf_exempt
def activarcuenta(request,id):

	u =AuthUser.objects.get(id=id)

	if u.type_user.name == 'Owner':
		u.cuenta = 1
	if u.type_user.name == 'User':
		u.cuenta = 1

	u.save()


	r = requests.post(HOST+'/send_simple_message/', data={"message": "Felicidades tu cuenta esta activada , ingrese a Inncomun para comenzar reservar habitaciones :)","subject":'Bienvenvido ',"receptor":u.email})
	r.status_code



	return render(request, 'cuenta.html',{'id':id,'host_front':HOST_FRONT})

@csrf_exempt
def cambiapassword(request,email):

	_user= AuthUser.objects.get(username=email)
	return render(request, 'cambiapassword.html',{'user':_user,'host_front':HOST_FRONT})

@csrf_exempt
def activarcuenta1(request,id,hotel,booking):

	u =AuthUser.objects.get(id=id)

	if u.type_user.name == 'Owner':
		u.cuenta = 1
	if u.type_user.name == 'User':
		u.cuenta = 1
	u.save()

	r = requests.post(HOST+'/send_simple_message/', json={"message": "Felicidades tu cuenta esta activada , ingrese a Inncomun para comenzar reservar  habitaciones :)","subject":'Bienvenvido ',"receptor":u.email})
	r.status_code



	return render(request, 'cuenta1.html',{'id':id,'host_front':HOST_FRONT,'hotel':hotel,'booking':booking})

class Tiponotis(JSONWebTokenAuthMixin, View):

	def get(self,request):

		notis = TipoNotifications.objects.all().values('id','body_es','body_en','status','perfil__name','subject_es','subject_en')

		data_dict = ValuesQuerySetToDict(notis)

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")

		


class Savenotis(JSONWebTokenAuthMixin, View):

	def post(self,request):

		data =  json.loads(request.body)['notis']

		for d in data:



			tn = TipoNotifications.objects.get(id=d['id'])
			tn.body_es = d['body_es']
			tn.body_en = d['body_en']
			tn.subject_en = d['subject_en']
			tn.subject_es = d['subject_es']
			tn.save()



		data_dict = ValuesQuerySetToDict('notis')

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")



class Setlan(JSONWebTokenAuthMixin, View):

	def get(self,request,id_user,lan):

		u = AuthUser.objects.get(id=id_user)

		if lan == 'es':

			u.lan = 'es'

		if lan == 'en':

			u.lan = 'en'

		u.save()


		data_dict = ValuesQuerySetToDict('notis')

		data_json = simplejson.dumps(data_dict)

		return HttpResponse(data_json, content_type="application/json")
