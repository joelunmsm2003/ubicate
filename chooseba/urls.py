from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf.urls import patterns
from choose.views import *

from django.conf.urls import url
from django.contrib import admin

admin.site.site_header = 'Ubicate'


urlpatterns = [


    url(r'^', admin.site.urls),
    url(r'^admin/', admin.site.urls),
    url(r'^usuarios/', usuarios),
    url(r'^registra/(\w+)', registra),
    url(r'^listaintercambio/(\w+)', listaintercambio),
    url(r'^actualiza/(\w+)', actualiza),
    url(r'^robotintercambio/', robotintercambio),
    url(r'^actualizaperfil/(\w+)', actualizaperfil),
    url(r'^profesiones/', profesiones),
    url(r'^updatealias/', updatealias),
    url(r'^miperfil/(\w+)', miperfil),
    url(r'^mensajes/(\w+)', mensajes),
    url(r'^buscaintercambio/(\w+)/(\w+)', buscaintercambio),
    url(r'^guardamensaje/(\w+)', guardamensaje),
    url(r'^guardaarchivo/', guardaarchivo),
    url(r'^guardapublicidad/(\w+)', guardapublicidad),
    url(r'^productoservicios/', productoservicios),
    url(r'^guardadatosmovil/', guardadatosmovil),
    url(r'^recibesolicitud/(\w+)/(\w+)', recibesolicitud),
    url(r'^califica/(\w+)/(\w+)', califica),
    url(r'^onesignalguarda', onesignalguarda),
    url(r'^eliminamensaje/(\w+)', eliminamensaje),
    url(r'^eliminaintercambio/(\w+)', eliminaintercambio),
    url(r'^guardaintercambio/(\w+)', guardaintercambio),
    url(r'^actualizaintercambio/(\w+)/(\w+)', actualizaintercambio),




]
