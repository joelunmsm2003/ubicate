from rest_framework import serializers

from choose.models import *


class HotelSerializer(serializers.ModelSerializer):

    class Meta:
        model = Hotel
        fields = ('name', 'star', 'description','photo')


class InteresSerializer(serializers.ModelSerializer):

    class Meta:
        model = Interest
        fields = ('name','id')


class UserSerializer(serializers.ModelSerializer):

	type_user = serializers.StringRelatedField(many=False)

	class Meta:
		model = AuthUser
		fields = ('username','id','last_login','first_name','last_name','email','phone','type_user')

