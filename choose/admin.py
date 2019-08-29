from django.contrib import admin
from choose.models import *
from django.contrib.admin import RelatedOnlyFieldListFilter

from django.contrib.admin import AdminSite
from django.utils.translation import ugettext_lazy

from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.models import User
from PIL import Image
from resizeimage import resizeimage
import os.path
from PIL import Image
from resizeimage import resizeimage
from django.utils.html import format_html
from django.contrib import admin


@admin.register(Estado)
class EstadoAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')


@admin.register(Sexo)
class SexosAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')


@admin.register(Intercambio)
class IntercambioAdmin(admin.ModelAdmin):
	list_display = ('id','user','deseo','_ofrezco','estado')


@admin.register(Formapago)
class FormapagoAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')


@admin.register(Ocupacion)
class OcupacionAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')

@admin.register(Productoservicio)
class ProductoservicioAdmin(admin.ModelAdmin):
	list_display = ('id','nombre')

	

@admin.register(Usuarios)
class UsuariosAdmin(admin.ModelAdmin):
	list_display = ('id','lat','lng','nombre','ocupacion','numero_cuenta','modelo_celular','version_celular','publicidadcompartir')
	list_editable=('publicidadcompartir',)



@admin.register(Mensaje)
class MensajeAdmin(admin.ModelAdmin):
	list_display = ('id','descripcion','origen','destino','eliminado')


	