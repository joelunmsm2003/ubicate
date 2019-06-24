FORMAT: 1A
HOST: http://chooseandbookit.tk:8000/

# CBI Developer API Documentation

API CBI es una colleccion de APIS para reserva de hoteles 


## Authentificacion [/api-token-auth/]

### POST [POST]

La mayoria de los endpoints de CBI requieren autentificacion por tokens para generar un token hacer una peticion POST
a este endpoint con el usuario y contraseña 

+ Request (application/json)

        {
            "username": "admin",
            "password": "rosa0000"
        }


## Usuarios [/user/]

### Lista usuarios segun perfil logeado [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwidXNlcl9pZCI6MSwiZW1haWwiOiJhZG1pbkBjaG9vc2Vib29raXQiLCJleHAiOjQ0ODUyODc0NzZ9.--zsO_bLLzbkXQC6MYZacy4vL2yHF4ydBsW_0fi972g


### Crea un nuevo usuario [POST]

+ Request (application/json)

    + Headers
    
            Content-Type: application/json
            Authorization: Bearer JWT

    + Body 
    
        {
            datos:
            {
                city:1,
                email:"joelunsm@gmail.com",
                first_name:"user123",
                password:"rosa0000",
                phone:33232,
                role:1,
                username:"user123"
            }            
        }

### Actualiza un usuario [PUT]

+ Request (application/json)

    + Headers
    
            Content-Type: application/json
            Authorization: Bearer JWT

    + Body 
    
        {
             datos:
            {
                city:1,
                email:"joelunsm@gmail.com",
                first_name:"user123",
                password:"rosa0000",
                phone:33232,
                role:1,
                username:"user123"
            }

        }

## Creacion de Usuario [/signup/]
            
### POST [POST]

+ Request (application/json)

    + Headers
    
            Content-Type: application/json
            Authorization: Bearer JWT

    + Body 
    
        {
            dataprocesar:
            {
                first_name: "Joel", 
                email: "joelunmsm@gmail.com", 
                phone_number: 980729169, 
                username: "username125", 
                password: "323" 
            }
            url:
            {
                data:12
            }

        }
        
## Perfil actual [/user/perfil/]

### Usuario logeado [GET]

Obtiene informacion del usuario logeado en CBI

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Hoteles [/hotel]

### Lista hoteles [GET]

### Crea un hotel [POST]

+ Request

## Hotel Admin [/hoteladmin/]

### Hoteles para el admin [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Informacion de un hotel [/hotel/{id}]

### GET [GET]

+ Request

    + Parameters

        + id (required, number, `26`)

## Plantillas de un hotel [/hotel/{id}/template]

### GET [GET]

+ Request

    + Parameters
    
        + id (required, number, `26`)

## Disponibilidad de las habitaciones [/public2]

### POST[POST]

+ Request
    
    + Body
     
    {
        hotel:28,
        checkin:"2017-01-24T05:00:00.000Z",
        checkout:"2017-01-26T05:00:00.000Z",
        adults:2,
        childrens:0,
        rooms:3
    }

## Photos del hotel [/hotel/{id}/photo]

### GET [GET]

+ Request

    + Parameters
    
        + id (required, number, `26`)

## Actualiza un hotel [/hotel/update]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Body
    {
        address:"Benavides 1001 Miraflores",
        amenity:[],
        calle:"Benavides",
        city:13,
        city__name:"Lima",
        description:"<p>  </p>",
        description_es:"<p> Esta Hotel es excelente. </p>",
        district:"Miraflores",
        featured:null,
        hold_limit:0,
        id:34,
        interes:[],
        later:null,
        name:"Annett Hotel",
        nlote:"1001",
        photo:187,
        photo__caption:"",
        photo__url:null,
        policies:"<p>    </p>",
        policies_es:"<p></p>",
        politics:"   ",
        politics_es:" ",
        price:46,
        reference:[],
        referencias:[],
        star:{id: 3, label: "3"},
        status:2,
        tripadvisor:null,
        user:64,
        user__first_name:"Annett",
        user__phone:999,
        user__seller:666
    }

## Busqueda Inicial de hoteles segun la ciudad y interes [/hotel/search]

## POST [POST]

+ Request
    
    + Body
    {
        cities_id:"13",
        data:"6",
        intereses_id:""
    }

## Activa/Desactiva Pagar Despues [/hotel/{id}/later]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + id (required, number, `26`)

## Activa/Desactiva Ranking de vistas en el Home [/hotel/{id}/featured]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + id (required, number, `26`)

## Elimina un hotel [/hotel/delete/{id}]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + id (required, number, `26`)

## Plantillas Padre [/template]

### Crea una plantilla [POST]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Body
    {
        adult:1,
        bath:1,
        child:2,
        defaultbed:1,
        name:"Nueva Plantilla",
        total:2
    } 


### Lista las plantillas padre [GET]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

### Actualiza una plantilla padre [PUT]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Reserva [/booking]

### Owner crea una reserva [POST]

+ Request (application/json)

    + Body
    
    {
        data:
        {
            checkin:"2017-01-24T05:00:00.000Z",
            checkout:"2017-01-26T05:00:00.000Z",
            hotel:"34",
            room:[
            {
                hotelroomtemplate: 35, 
                description: "98", 
                photo: null, 
                price: 120
            }],
            adults:1,
            children:0,
            contadorbed:0,
            description:"98",
            hotelroomtemplate:35,
            hotelroomtemplate__max_occupancy:2,
            hotelroomtemplate__roomtemplate__id:4,
            hotelroomtemplate__roomtemplate__name:"Single Superior",
            id:31,
            maxadults:1,
            maxchildrens:1,
            name:"989",
            photo:null,
            price:120,
            roomstatus__name:"Available",
            status2:false,
            status3:true,
            statusicon:true,
            todo:"989  |  Single Superior"
        }
    }

## Reserva por tiempo [/booking/{hotel}/{categoria}]

### GET [GET]

+ Request

    + Parameters
    
        + hotel (required, number, `26`)
        + categoria (required, number, `1`)

##  Actualiza una reserva [/booking/update]

### PUT [PUT]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Body
    
    {
        {"hotel":"34",
        "datos":
        {"extrasingle":[],
        "rooms":
            [{
            "extrasingle":null,
            "room__hotelroomtemplate__roomtemplate__name":"Single Superior",
            "room__hotelroomtemplate":35,
            "price":"120",
            "child_occupants":0,
            "hotelroomtemplate__roomtemplate__name":"Single Superior",
            "name":"989",
            "children":0,
            "room__name":"989",
            "room__hotelroomtemplate__precio":120,
            "adults":1,
            "extradoble":null,
            "id":106,
            "adult_occupants":1,
            "room__hotelroomtemplate__roomtemplate__id":4}],
        "id":99,
        "attendant":null,
        "user__phone":null,
        "user__first_name":null,
        "traveler_email":"323",
        "user__photo__caption":null,
        "checkout":"2017-01-26T05:00:00.000Z",
        "traveler_mobile":"32",
        "checkin":"2017-01-24T05:00:00.000Z",
        "hotel":34,
        "user":null,
        "user__email":null,"user__seller":null,
        "info":[{"room":1,"price":"120","beds":0,"room__hotelroomtemplate__precio":120,"total":120,"room__hotelroomtemplate__roomtemplate__name":"Single Superior"}],
        "hotel__user__seller":666,
        "pricetotal":120,"user__city__name":null,
        "status__name":"Held",
        "traveler_name":"32",
        "extradoble":[],
        "codigo":"PE-34-99",
        "checkin1":"Tue Jan 24 2017",
        "checkout1":"Thu Jan 26 2017"
        }
        }

    }

## Calcula disponibilidad de una reservacion [/booking/public]

### POST [POST]

+ Request

    + Body
        
        {"template":
        [{
            "ndisbed":20,
            "extrasingle":0,
            "activate":1,
            "childrens":0,
            "photo":"static/026_RtxRdDY.jpg",
            "rooms":[],
            "id":1,
            "ndis":1,
            "adults":20,
            "default_bed":1,
            "adult_occupancy_limit":20,
            "privatebathrom":0,
            "template":289,
            "description":"1212",
            "name_es":"Cama",
            "max_occupancy":20,
            "price":12,
            "extradouble":0,
            "name":"Bed",
            "total_occupancy_limit":20,
            "child_occupancy_limit":0,
            "photo__caption":"static/026_RtxRdDY.jpg",
            "statusicon":false,
            "estadox":true,
            "disabled":false,
            "reserva_adults":2,
            "reserva_rooms":1,
            "reserva_childrens":0,
            "info":{"checkin":"2017-01-24T05:00:00.000Z","checkout":"2017-01-26T05:00:00.000Z","rooms":2,"adults":1,"childrens":1,"hotel":149},"maxoccupancy":20,"pricetotal":12,"alert":false
            }
       ]}

## Asigna habitaciones Public [/booking/confirma]

### POST [POST]

+ Request

## Asigna habitaciones Privado [/booking/confirma/logeado]

### Crea la reserva y asigna las habitaciones para esta reserva para un usuario del sistema [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Body

        {
            data:
            {
            177: [177, 1, 0, 0, 0], 
            228: [228, 2, 0, 0, 0]
            }

        }



## Pay Later [/booking/paylater]

+ Request

### Actualiza a Held una reserva [POST]

+ Request

## Informacion de una reserva 1 [/booking/info/public/{id}]

### GET [GET]

+ Request

    + Parameters
    
        + id (required, number, `26`)

## Informacion de una reserva 2 [/booking/info/{id}]

### GET [GET]

+ Request

    + Parameters
    
        + id (required, number, `26`)

## Cambiar reserva [/booking/change]

### POST [POST]

+ Request

## Reservas del user [/booking/user]

### POST [POST]

## Reservas de un user [/booking/user]

### POST [POST]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Contador de reservas del usuario [/booking/user/valida]

### POST [POST]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Lista reservas del hotel [/booking/{hotel}]

### POST [POST]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Actualiza reserva del hotel [/booking/upgrade/lista/]

### POST [POST]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Room [/room]

### Crea un room [POST]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

### Elimina un room [DELETE]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

### Actualiza un room [PUT]

+ Request (application/json)

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Room Info [/room/{id}]

### POST [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + id (required, number, `26`)

## Precio de la reserva [/room/array]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + id (required, number, `26`)

## Rooms de un hotel [/room/{hotel}]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + hotel (required, number, `26`)

## Amenity [/amenity]

### GET [GET]

## Informacion General [/infogeneral]

### GET [GET]

## Reference [/reference]

### GET [GET]


## Subir foto de perfil [/uploadphotoperfil]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Chips [/chips]

### Lista todos los intereses y ciudades [POST]

## Photo Visible [/photovisible/(photo)/(status)]

### Asigna visibilidad de la foto [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + photo (required, number, `26`)
        + status (required, number, `1`)

## Photo Principal [/photovisible/(photo)/{hotel}]

### Asigna foto principal de la foto de un hotel [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + photo (required, number, `26`)
        + status (required, number, `1`)

## Resend [/resend]

### Reenvia email de confirmacion [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Activa Email [/activaremailadmin]

### Activa usuario que no confirmo correo [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT


## Elimina photo [/deletephoto/(photo)/{hotel}]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + photo (required, number, `6`)
        + hotel (required, number, `26`)

## Sube foto de tipo de room [/photoroomtype]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Intereses [/search/interes/]

### POST [POST]

## Amenity [/search/amenity/]

### POST [POST]

## Reference [/search/reference/]

### POST [POST]

## Star [/search/star]

### POST [POST]

## Price [/search/price]

### [POST]

## 2Checkout [/checkoutdos]

### Procesa la respuesta de 2 checkout [POST]

## Becomeowner  [/becomeowner]

### Registro de un nuevo dueño de hotel [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Publish  [/publish/{hotel}]

### Pedir publicacion del hotel [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + hotel (required, number, `26`)

## Aprobar un hotel [/approve/{hotel}]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + hotel (required, number, `26`)


## Rechazar un hotel [/desaprobar/{hotel}]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + hotel (required, number, `26`)

## Notification [/notification]

### Lista notificaciones [POST]

## Configuracion Email [/smtp]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

##  Envio de Email [/send_simple_message]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Body
    {
        "message": 'Bien',
        "subject":'Choose & Book It' ,
        "receptor":email
    }

## Activar cuenta [/activarcuenta/{id}]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + id (required, number, `26`)

## Activar Suscripcion [/suscripcion]

### POST [POST]

Guarda respuesta de 2Checkout

+ Request

    + Parametros de 2Checkout

## Cancela suscripcion [/cancelsuscripcion/{user}]

### POST [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + user (required, number, `4`)



## Pagos de la Suscripcion [/paymentsub]

### Lista todo los pagos de la suscripcion [POST]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Body
    {
        {
        "user":
            {
                "username":"pablo666",
                "city":76,
                "first_name":"re",
                "last_name":"",
                "type_user__name":"Owner",
                "hotelcount":1,
                "hotel":[{"star":1,"description":"43 ","fexpiracion1":"06-12-2016","fexpiracion":"06 12 2016","id":228,"address":"3443 43 434","subscrito":0,"name":"Par988"}],
                "cuenta":4,
                "email":"joelunmsm@gmail.com",
                "city__name":null,
                "phone":393939,
                "photo__caption":"static/Perfil_Scarlett_Johansson_800.jpg",
                "seller":123,
                "email_noti":null,
                "pais":null,
                "password":"*****",
                "id":339
            }
        }
    }

## Elimina un usuario [/delete/(user)]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + user (required, number, `26`)

## Tipo de Notificaciones [/tiponotis]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Actualiza Notificaciones [/savenotis]

### PUT [PUT]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

## Actualiza idioma del usuario [/setlan/(user)/(language)]

### GET [GET]

+ Request

    + Headers

        Content-Type: application/json
        Authorization: Bearer JWT

    + Parameters
    
        + user (required, number, `26`)
        + language (required, number, `26`)
