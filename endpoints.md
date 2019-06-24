Hotels & Bookit 
Web API Base URL: https://hotelsandbookit.com

Method		Endpoints				 					Usage								 					Response            Access		Type

User
GET         /user                                       Obtiene el usuario actual								user 				OAuth
GET 		/users/                                     Lista todos los usuarios								users 				OAuth
GET         /user/{user_id}                             Obtiene un usuario por ID 								user 				OAuth
GET         /users/owner								Lista todos los dueños de los hoteles						user                OAuth
GET 		/users/hotel/{hotel_id}				        Lista de clientes de un hotel 							users               OAuth		
GET         /user/reservation/{reservation_id}			Obtiene el usuario de una reservacion                   user                OAuth
POST        /user/										Crea un usuario                                         user                OAuth
PUT         /user/                                      Actualiza un usuario                                    user                OAuth
DELETE		/user/{user_id}								Elimina un usuario                                      user                OAuth
GET         /users/types                                Lista tipo de usuarios                                  types user          OAuth

Hotel

GET     	/hotel/{hotel_id}				 			Obtiene un hotel				 					    hotel         		        
GET         /hotels/                                    Lista todos los hoteles									hotels              
GET         /hotel/owner/{user_id}         				Obtiene el hotel de un dueño    	 					hotel               OAuth
GET         /hotels/city/{city_id}      			    Lista los hoteles de una ciudad  	 					hotels               
GET         /hotels/interest/{interest_id}     			Lista los hoteles de un interes      					hotels               
GET 		/hotels/star/{start_id}						Lista los hoteles segun la cantidad de estrellas        hotels               
GET 		/hotels/amenity/{amenity_id}				Lista los hoteles segun el amenity                 	    hotels
GET 		/hotels/reference/{reference_id}			Lista los hoteles segun la reference                    hotels
POST        /hotel/avaliable							Lista los hoteles segun el filtro					    hotels
POST        /hotel/search                               Retorna los hotels de una ciudad o interes              hotels
POST        /hotel/                                     Crea un hotel                                           hotel               OAuth
PUT         /hotel/                                     Edita un hotel                                          hotel               OAuth
DELETE      /hotel/{hotel_id}                           Elimina un hotel                                        hotel               OAuth


Photos

GET         /photos/hotel/{hotel_id}           		    Lista los fotos de un hotel        						photo
GET         /photos/room/{room_id}						Lista las fotos de un room                				photos				 			Private

City/Regions

GET         /cities/									Lista todas las ciudades
GET         /cities/{region}							Lista las ciudades de una region            			cities				 			Private
GET         /regions/                                   Lista todas las regiones                                regions
GET         /regions/pais/{pais_id}                     Lista las regiones de un pais                           regions
GET         /paises										Lista todos los paises									paises


Interests

GET         /interests/									Lista todos los intereses                               interests
GET         /interests/{interest_id}					Obtiene a interest por ID                               interest
GET         /interests/hotel/{hotel_id}					Lista los interes de un hotel                           interests


Amenity

GET         /amenities                                  Lista todos los amenities                               amenity
GET         /amenity/{amenity_id}                       Obtiene un amenity por ID                               amenity
GET         /amenity/hotel/{hotel_id}                   Lista los amenities de un hotel                         amenities


Rooms

GET         /room/{room_id}								Obtiene a room por ID                                   room
GET         /rooms/hotel/{hotel_id}						Lista los rooms de un hotel            					rooms
GET         /rooms/reservation/{reservation_id}         Lista los rooms de una reservacion                      rooms                OAuth                                    
POST		/rooms/available  							Filtra rooms disponibles segun el filtro				rooms	             OAuth
POST        /room/                                      Crea una room                                           room                 OAuth
PUT         /room/{room_id}                             Edita una room                                          room                 OAuth
DELETE      /room/{room_id}                             Elimina una room                                        room                 OAuth



Reservation
                                                 
GET         /reservation/{reservation_id}				Obtiene una reservacion                                 reservation          OAuth
GET         /reservations                               Lista todas las reservaciones                           reservations         OAuth
GET         /reservation/status                         Lista estados de la reservacion                         status               OAuth
GET         /reservations/user/{user_id}				Lista las reservaciones de un usuario		            reservations         OAuth 			
GET         /reservations/hotel/{hotel_id}            	Lista las reservaciones de un hotel 		            reservations         OAuth
GET         /reservations/room/{room_id}                Lista reservaciones de un room				            reservations         OAuth
POST        /reservation/room                           Reserva de rooms                                        rooms    
POST        /reservation                                Crea una reservacion                                    reservation          OAuth
POST        /reservation/monto                          Calcula el monto de una reservacion                     reservation          OAuth
GET         /reservation/cancela/{reservation_id}       Cancela una reservacion                                 reservation          OAuth
GET         /reservation/approve/{reservation_id}       Aprueba una reservacion                                 reservation          OAuth
POST        /reservations/filter                        Filtra reservaciones                                    reservations         OAuth
PUT         /reservation/                               Edita una reservacion                                   reservation          OAuth
DELETE      /reservation/{reservation_id}               Elimina una reservacion                                 reservation          0Auth   
GET         /reservations/user/{id}/status              Reservaciones agrupadas por estado                      reservations         0Auth 


Template

POST        /template                                   Crea un template                                        template
GET         /templates/hotel/{id}                       Lista los templates de un hotel                         templates
GET         /template/{id}/hotel/{id}                   Asigna un template a un hotel                           template
GET         /templates                                  Lista todos los tipos de templates                      templates
PUT         /template                                   Edita un template                                       template

Payment

POST        /payment/reservation/{id}					Ve el estado de la reservacion                                               OAuth
GET         /payments/types								Lista todos los tipos de payments                       types payments       OAuth
GET         /payments/reservation/{reservation_id}      Lista los payments de una reservacion                   payments             OAuth



Authorization

POST        /api-token-auth								Get an access token                                     token                 OAuth