from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.contrib.auth.models import Group, User
from jwt_auth.compat import json
from jwt_auth.mixins import JSONWebTokenAuthMixin

import simplejson
from django.views.decorators.csrf import csrf_exempt
import xlrd

from choose.models import *

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from datetime import datetime




def ValuesQuerySetToDict(vqs):

    return [item for item in vqs]



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
def booking(request,id_hotel):

    if request.method == 'GET':


        books = RoomReservation.objects.filter(room__hotel=id_hotel).exclude(reservation__status__name='Requested').values('id','reservation__traveler_name','room__name','child_occupants','adult_occupants')

        for i in range(len(books)):

  
            books[i]['checkin'] = str(RoomReservation.objects.get(id=books[i]['id']).checkindate).replace(' 00:00:00+00:00','')

            books[i]['checkout'] = str(RoomReservation.objects.get(id=books[i]['id']).checkoutdate).replace(' 00:00:00+00:00','')


        hotels_dict = ValuesQuerySetToDict(books)

        data_json = simplejson.dumps(hotels_dict)

        return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def reference(request):

        reference = Reference.objects.all().values('id','name','city__name','city')

        reference_dict = ValuesQuerySetToDict(reference)

        data_json = simplejson.dumps(reference_dict)

        return HttpResponse(data_json, content_type="application/json")


