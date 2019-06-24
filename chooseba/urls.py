from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf.urls import patterns
from choose.views import *
from choose.user import *
from choose.hotel import *
from choose.cities import *
from choose.interest import *
from choose.template import *
from choose.amenity import *
from choose.booking import *
from choose.room import *
from django.conf.urls import url
from django.contrib import admin

admin.site.site_header = 'Choose & Book It'


urlpatterns = [


    url(r'^', admin.site.urls),
    url(r'^admin/', admin.site.urls),
    url(r'^api-token-auth/', 'jwt_auth.views.obtain_jwt_token'),

    #Hotels

    url(r'^hotel/$', 'choose.hotel.hotellist'), # GET POST
    url(r'^hoteladmin/$', Hoteladmin.as_view()), # GET POST
    url(r'^hotel$', 'choose.hotel.hotellist'), # GET POST
    url(r'^hotel/(\d+)/$', 'choose.hotel.hotelid'), # GET POST PUT   
    url(r'^hotel/(\d+)/template/$', 'choose.hotel.template'), #
    url(r'^public2/$', 'choose.hotel.public2'),
    url(r'^hotel/(\d+)/photo/$', 'choose.hotel.photohotel'),
    url(r'^hotel/update/$', Hotelupdate.as_view()),
    url(r'^hotel/filtro/$', 'choose.hotel.filtro'),
    url(r'^hotel/search/$', 'choose.hotel.search'),
    url(r'^hotel/(\d+)/featured/(\d+)/$', 'choose.hotel.featured'),
    url(r'^hotel/(\d+)/later/(\d+)/$', 'choose.hotel.later'),
    url(r'^hotel/delete/(\d+)$', Hoteldelete.as_view()),

    #Cities

    url(r'^cities/interest/$', 'choose.cities.interests'),
    url(r'^city/$', 'choose.cities.city'),
    
    #User

    url(r'^user/$', Usuario.as_view()),
    url(r'^user/(\d+)/$', UserId.as_view()),
    url(r'^user/tipos/$', 'choose.user.tipos'),
    url(r'^user/clientes/$', UsuarioClientes.as_view()),
    url(r'^user/perfil/$', Perfil.as_view()),        
    url(r'^signup/$', 'choose.user.signupfunction'),
    url(r'^changepassword/(\w+)/(\d+)$', 'choose.tests.changepassword'),
  

    #Templates

    url(r'^template/$', 'choose.template.template'),
    url(r'^template/hotel/(\d+)/$', 'choose.template.hotel'), # Lista de Habitaciones

    #Interests

    url(r'^interests/$', 'choose.interest.interests'),


    #Booking


    url(r'^booking/(\d+)/(\d+)$', 'choose.booking.booking'),
    url(r'^booking/$', 'choose.booking.bookings'),
    url(r'^booking/update/$', Bookingupdate.as_view()),
    url(r'^booking/public$', 'choose.booking.public'),
    url(r'^booking/confirma$', 'choose.booking.confirma'),
    url(r'^booking/confirma/logeado$', Bookinglogeado.as_view()),
    url(r'^booking/paylater$', Paylater.as_view()),
    url(r'^booking/info/public/(\d+)$', 'choose.booking.info'),
    url(r'^booking/info/(\d+)$', BookingInfo.as_view()),
    url(r'^booking/change/$', Bookingchange.as_view()),
    url(r'^booking/(\d+)/(\d+)/(\d+)$', 'choose.booking.fecha'),
    url(r'^booking/user$', Bookinguser.as_view()),
    url(r'^booking/user/valida$', Bookinguservalida.as_view()),
    url(r'^booking/(\d+)$', BookingHotel.as_view()),
    url(r'^booking/upgrade/lista/$', BookingUpgrade.as_view()),
    #url(r'^bookpublic/$', 'choose.booking.bookpublic'),
    

    #Room
    
    url(r'^room/$', 'choose.room.room'),
    url(r'^room/(\d+)/$', RoomBooking.as_view()),
    url(r'^room/reserva/(\d+)/(\d+)/$', 'choose.room.reserva'),
    url(r'^room/fecha/$', 'choose.room.fecha'),
    url(r'^room/array/$', 'choose.room.array'),
    url(r'^room/hotel/(\d+)/$', 'choose.room.hotel'),


    #Ammenity

    url(r'^amenity/$', 'choose.amenity.amenity'),

    #Ammenity

    url(r'^infogeneral/$', 'choose.hotel.infogeneral'),

    #Reference

    url(r'^reference/$', 'choose.reference.reference'),
    
    
    
    #System
    url(r'^uploadphoto/$', 'choose.hotel.photo'), # Subir foto de hotel
    url(r'^uploadphotoperfil/$', 'choose.hotel.photoperfil'),
    url(r'^uploadicon/$', 'choose.views.icon'),
    url(r'^log/$', 'choose.hotel.log'),
    url(r'^chips/$', 'choose.hotel.chips'),
    url(r'^photo/(\d+)/(\d+)/$', 'choose.hotel.photovisible'), 
    url(r'^photoprincipal/(\d+)/(\d+)/$', 'choose.hotel.photoprincipal'), 
    url(r'^existphoto/$', 'choose.views.existphoto'), 
    url(r'^resend/(\d+)/$', Resend.as_view()), 
    url(r'^activaremailadmin/(\d+)/$', Activaremailadmin.as_view()), 
    url(r'^deletephoto/(\d+)/(\d+)/$', DeletePhoto.as_view()), 
    url(r'^utc/$', UTC.as_view()), 
    url(r'^photoroomtype/$', 'choose.views.photoroomtype'),



    #Search

    url(r'^search/interes/$', 'choose.hotel.interes'),

    url(r'^search/amenity/$', 'choose.hotel.amenity'),
    url(r'^search/reference/$', 'choose.hotel.reference'),
    url(r'^search/star/$', 'choose.hotel.star'),
    url(r'^search/price/$', 'choose.hotel.price'),

    url(r'^category/$', 'choose.views.category'),
    url(r'^categoryid/$', 'choose.views.categoryid'),
    url(r'^checkoutdos/$', Paycheckoutinline.as_view()),
    url(r'^doscheckout/$', 'choose.views.doscheckoutcard'),
    url(r'^becomeowner/$', 'choose.views.becomeowner'),
    url(r'^registroduenohotel/$', 'choose.views.registroduenohotel'),
    url(r'^registrohotel/$', Registrohotel.as_view()),
    url(r'^publish/(\d+)$', Publish.as_view()),
    url(r'^approve/(\d+)$', Approve.as_view()),
    url(r'^draft/(\d+)/(\w+)$', Draft.as_view()),


    #Notifications

    url(r'^notification/$', 'choose.views.notification'),
    url(r'^vistonotification/(\d+)$', 'choose.views.vistonotification'),
    url(r'^recuperapass/(?P<email>[\w.@+-]+)$', 'choose.views.recuperapass'),

    url(r'^cambiapassword/(?P<email>[\w.@+-]+)$', 'choose.views.cambiapassword'),

    url(r'^smtp/$', 'choose.views.smtp'),

    url(r'^viewsmtp/$', 'choose.views.viewsmtp'),
    url(r'^send_simple_message/$', 'choose.views.send_simple_message'),
    url(r'^prueba/$', 'choose.views.prueba'),
    url(r'^enviaemailprueba/$', 'choose.views.enviaemailprueba'),
    url(r'^pagos/$', 'choose.views.pagos'),
    url(r'^respuestapago/$', 'choose.views.respuestapago'),
    url(r'^activarcuenta/(\d+)/$', 'choose.views.activarcuenta'),
    url(r'^activatemplate/(\d+)$', 'choose.hotel.activatemplate'),
    url(r'^activarcuenta1/(\d+)/(\d+)/(\d+)/$', 'choose.views.activarcuenta1'),
    url(r'^suscripcion/$', Suscripcion.as_view()),

    url(r'^eliminaphoto/(\d+)$', Eliminaphoto.as_view()),
    url(r'^cancelsuscripcion/(\d+)$', Cancelsuscripcion.as_view()),
    url(r'^paymentsub/$',Paysub.as_view()),
    url(r'^deleteuser/(\d+)$',Deleteuser.as_view()),
    url(r'^tiponotis/$',Tiponotis.as_view()),
    url(r'^savenotis/$',Savenotis.as_view()),
    url(r'^setlan/(\d+)/(\w+)$',Setlan.as_view()),



]
