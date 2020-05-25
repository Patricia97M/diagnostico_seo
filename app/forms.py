from wtforms import Form
from wtforms import TextField
from wtforms import validators
import requests, logging, sys 

def validar_existencia(form, url):
    try:
        dato=form.url.data.strip()
        req= requests.get(dato)
        statusCode= req.status_code
    except requests.exceptions.ConnectionError:
        raise validators.ValidationError("Error de conexion")
    except requests.exceptions.HTTPError:
        raise validators.ValidationError("URL invalida")
    except requests.exceptions.RequestException as e:
        raise validators.ValidationError("Error, intente con una nueva URL")
   
class AnalisisUrl(Form):
    url = TextField('url',[validar_existencia, validators.Required('Error, Complete el campo')])
    punto =TextField('punto')



