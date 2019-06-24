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

