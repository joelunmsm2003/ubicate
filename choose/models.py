# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models

from django.conf import settings

import datetime



class Formapago(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Forma Pago'


    def __unicode__(self):
        return self.nombre


class Sexo(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Sexo'


    def __unicode__(self):
        return self.nombre

class Ocupacion(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)
    icon=models.CharField(max_length=1000,blank=True, null=True)
    categoria=models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Profesion'


    def __unicode__(self):
        return self.nombre


class Productoservicio(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)
    icon=models.CharField(max_length=1000,blank=True, null=True)
    categoria=models.CharField(max_length=1000,blank=True, null=True)



    class Meta:
        managed = True
        verbose_name = 'Productos Servicio Intercambio'


    def __unicode__(self):
        return self.nombre



class Estado(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Estado'


    def __unicode__(self):
        return self.nombre

class Estadouser(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Estadouser'


    def __unicode__(self):
        return self.nombre

class Usuarios(models.Model):

    nombre = models.CharField(max_length=1000,blank=True, null=True)
    sexo = models.ForeignKey(Sexo,blank=True, null=True)
    estado = models.ForeignKey(Estadouser,blank=True, null=True)
    edad = models.CharField(max_length=1000,blank=True, null=True)
    alias = models.CharField(max_length=1000,blank=True, null=True)
    ocupacion = models.ForeignKey(Ocupacion,blank=True, null=True)
    lat=models.CharField(max_length=1000,blank=True, null=True)
    lng=models.CharField(max_length=1000,blank=True, null=True)
    iconData=models.CharField(max_length=1000,blank=True, null=True)
    name=models.CharField(max_length=1000,blank=True, null=True)
    address=models.CharField(max_length=1000,blank=True, null=True)
    icon=models.CharField(max_length=1000,blank=True, null=True)
    foto=models.CharField(max_length=1000,blank=True, null=True)
    uuid=models.CharField(max_length=1000,blank=True, null=True)
    numero_cuenta=models.CharField(max_length=1000,blank=True, null=True)
    telefono=models.CharField(max_length=1000,blank=True, null=True)
    descripcion=models.CharField(max_length=10000,blank=True, null=True)
    archivo = models.FileField(upload_to='static',blank=True, null=True)
    publicidad = models.FileField(upload_to='static',blank=True, null=True)
    publicidadcompartir = models.CharField(max_length=1000,blank=True, null=True)
    precio = models.CharField(max_length=1000,blank=True, null=True)
    version_celular = models.CharField(max_length=1000,blank=True, null=True)
    modelo_celular = models.CharField(max_length=1000,blank=True, null=True)
    numero_notificacion= models.CharField(max_length=1000,blank=True, null=True)
    ip= models.CharField(max_length=1000,blank=True, null=True)
    fecha_creacion = models.DateTimeField(blank=True,null=True,default=datetime.datetime.today())
    fecha = models.DateTimeField(blank=True,null=True)

    class Meta:
        managed = True
        verbose_name = 'Usuarios'


    def __unicode__(self):

        try:

            return str(self.nombre)

        except:

            return self.uuid



class Position(models.Model):

    lat = models.CharField(max_length=1000,blank=True, null=True)
    lng = models.CharField(max_length=1000,blank=True, null=True)
    usuario = models.ForeignKey(Usuarios,blank=True, null=True,related_name='position')


    class Meta:
        managed = True
        verbose_name = 'Position'


    def __unicode__(self):
        return self.lat





class Mensaje(models.Model):

    fecha = models.DateTimeField(blank=True,null=True,default=datetime.datetime.today())
    descripcion = models.CharField(max_length=1000,blank=True, null=True)
    texto = models.CharField(max_length=1000,blank=True, null=True)
    precio = models.CharField(max_length=1000,blank=True, null=True)
    numero_cuenta = models.CharField(max_length=1000,blank=True, null=True)
    origen = models.ForeignKey(Usuarios,blank=True, null=True, related_name='origen')
    destino = models.ForeignKey(Usuarios,blank=True, null=True, related_name='destino')
    formapago = models.ForeignKey(Formapago,blank=True, null=True, related_name='formapago')
    archivo = models.FileField(upload_to='static',blank=True, null=True)
    estado = models.ForeignKey(Estado,blank=True, null=True)
    estrella = models.CharField(max_length=1000,blank=True, null=True)
    eliminado = models.CharField(max_length=1000,blank=True, null=True)


    class Meta:
        managed = True
        verbose_name = 'Mensaje'




class Intercambio(models.Model):

    fecha = models.DateTimeField(blank=True,null=True,default=datetime.datetime.today())
    deseo = models.ForeignKey(Productoservicio,blank=True, null=True, related_name='interdeseo')
    ofrezco = models.ForeignKey(Productoservicio,blank=True, null=True, related_name='interofrezco')
    user = models.ForeignKey(Usuarios,blank=True, null=True, related_name='interuser')
    estado = models.ForeignKey(Estado,blank=True, null=True)
    eliminado = models.CharField(max_length=1000,blank=True, null=True)

    class Meta:
        managed = True
        verbose_name = 'Intercambio'


    def __unicode__(self):
        return self.deseo.nombre


    @property
    def _ofrezco(self):
        
       
   
        return self.ofrezco.nombre







