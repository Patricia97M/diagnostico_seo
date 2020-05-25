import requests, sys
from random import randint
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep
from selenium.webdriver.support.ui import WebDriverWait
from selenium.common.exceptions import WebDriverException as WDE
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import re
browser = webdriver.PhantomJS()

def protocoloSeg(url):
	browser.get("https://www.woorank.com/es")
	WebDriverWait(browser, 80).until(EC.presence_of_element_located((By.NAME, "url")))
	campo=browser.find_element_by_name("url")
	campo.send_keys(url)
	sleep(0.5)
	campo.send_keys(Keys.ENTER)
	try:
		WebDriverWait(browser, 80).until(EC.presence_of_element_located((By.CLASS_NAME, "module-title")))
		protocolo=[] #lista para guardar info de cada punto seo
		html= BeautifulSoup(browser.page_source,"html.parser")
		items = html.find("div",{'id': ['criterium-ssl_secured']})
		parteTexto = items.find("div",{'class': 'part text'})
		p = parteTexto.find("p").getText()
		if "Genial" in p:
			protocolo=[1,p]
		else:
			protocolo=[2,p]		
		return protocolo
	except (WDE, Exception) as e :
		error=[3,"No se pudo analizar"]
		return error


#velocidad
def TiempoCarga (url):
	browser.get("https://tools.pingdom.com/")
	WebDriverWait(browser, 80).until(EC.presence_of_element_located((By.ID, "urlInput")))
	input_url=browser.find_element_by_id("urlInput")
	input_url.send_keys(url)
	sleep(1)
	browser.find_element_by_class_name("test-button").click()
	try:
		element = WebDriverWait(browser, 40).until(EC.presence_of_element_located((By.CLASS_NAME, "value")))
		velocidad=browser.find_elements_by_class_name("value")
		grado=velocidad[0].text
		velocidad="Grado de rendimiento: "+grado+"%  Tiempo: "+velocidad[2].text
		if int(grado)>=90:
			estado=[1,velocidad]
		else :
			estado=[2,velocidad]  
		return estado
	except (WDE, Exception) as e :
		error=[3,"No se pudo analizar"]
		return error


def encabezados(url):
	lista=[]
	contenido = requests.get(url, timeout=12 ,headers={'User-Agent': 'Mozilla/5.0'})
	try:	
		contenido.raise_for_status()
		soup = BeautifulSoup(contenido.text, 'html.parser')
		h1 = len(soup.find_all("h1"))
		h = len(soup.find_all(re.compile("^h[1-6]")))
		if h1>0: 
			cadena = "H1 = "+str(h1)+" Se encontraron "+str(h)+" en total"
			encabezados=[1,cadena]
		elif h==0:
			cadena = "No se encontraron encabezados"
			encabezados=[2,cadena]
		else:
			cadena = "Se encontraron "+str(h)+" en total, no se encontraron H1"
			encabezados=[2,cadena]
		title = soup.title.string
		meta = soup.find("meta",{'name': 'description'})

		if (len(title) >=10 and len(title)<=70):
			titulo = [1,title]
		elif title==None:
			titulo = [2,"No posee la etiqueta <title>."]
		else:
			titulo = [2,title+"\n No cumple con los requisitos"]    

		if meta==None:
			descripcion = [2,"No posee la etiqueta <meta name='description'>."]
		elif meta.attrs['content']:
			metaD = meta.attrs['content']
			if (len(metaD) >=70 and len(metaD)<=160):
				descripcion = [1,metaD]
			else:
				descripcion = [2,metaD+"\n No cumple con los requisitos"]  
		else:
			descripcion = [2,"No posee la etiqueta <meta name='description'>."]
		lista.append(encabezados)
		lista.append(titulo)
		lista.append(descripcion)
	except Exception as e:
		lista=[3,"No se pudo calcular"]
	return lista


def ratio(url):
	try:
		browser.get("https://labs.woko.agency/calculadora-de-ratio-codigotexto/")
		WebDriverWait(browser, 70).until(EC.presence_of_element_located((By.ID, "url")))
		input_url=browser.find_element_by_id("url")
		input_url.send_keys(url)
		sleep(1)
		browser.find_element_by_class_name("orangebutton").click()
		sleep(5)
		ratio = browser.find_element_by_id("ratioresult").text
		numero =  ratio.strip("%")
		cadena="El ratio código/texto es de: "+numero+"%"
		if float(numero)>float(20):
			estado=[1,cadena]
		else :
			estado=[2,cadena]  
		return estado
	except (WDE, Exception) :
		error=[3,"No se logro calcular"]
		return error
	browser.close()


def seigo(url, titulosSeleccionados):
	descripcion=[]
	indice=0
	comparacion=0
	dicc_one = {}
	diccionario={}
	tituloPagina=['Titulo','Metadescripciones','Vista','Keywords','Encabezados2','Atributo Alt','Backlinks','Enlaces internos','Enlaces externos','Enlaces rotos','URL','Redireccionamiento','Canonicalizacion','Robots.txt','Mapa del sitio XML','Blog','Formulario','Autoridad de dominio','Pagina autoridad','Optimización móvil','Compatibilidad','Tamaño F']
	for item in titulosSeleccionados:
		if item in tituloPagina:
			comparacion=comparacion+1
	try:		
		lista=encabezados(url) #diccionario contiene encabezado, titulo y meta-descripcion
		for item2 in titulosSeleccionados:
			if "Título" == item2:
				diccionario["Título"] = lista[1]
			if "Meta-descripciones" == item2:
				diccionario["Meta-descripciones"] = lista[2]
			if "Encabezados" == item2:
				diccionario["Encabezados"] = lista[0]	
			if "Relación texto/HTML" == item2:
				ratio1=ratio(url)
				diccionario["Relación texto/HTML"] = ratio1
			if "Velocidad" == item2:
				velocidad=TiempoCarga(url)
				diccionario["Velocidad"] = velocidad				
			if "Protocolo seguro" == item2:
				protocolo=protocoloSeg(url)
				diccionario["Protocolo seguro"] = protocolo
	except (WDE,Exception) as e:
		pass
	try:
		if comparacion > 0:
			browser.get("https://seigoo.com")
			element = WebDriverWait(browser, 100).until(EC.presence_of_element_located((By.NAME, "c")))
			element.click()
			input_url=browser.find_element_by_name("u")
			input_url.send_keys(url)
			sleep(1)
			input_url.send_keys(Keys.ENTER)
			WebDriverWait(browser, 100).until(EC.presence_of_all_elements_located((By.ID, "seob")))
			page = BeautifulSoup(browser.page_source,"html.parser")
			contenedor= page.find_all("div",{'class': 'contenido panel panel-default panel-body'},limit=2)
			for x,item in enumerate(contenedor):
				modulo= item.find_all("li")
				for i, mod in enumerate(modulo):
					if i==10:
						continue
					div=mod.find("div",{'class': 'col-md-6 col-md-push-5'})
					estado=mod.img['class'] 
					if div:
						div=div.getText(strip=True)
						div=div.replace('VER', '').replace('Ver','').replace('   ', '').replace('\n', ' ')
						if i==5:
                                                        div=div.replace('http', '\n http')
						if i==7 or i==8 or i==9:
							cadena= re.search('[0-9]{,4}...enlaces', div)
							if cadena:
								div=cadena.group(0)
						if i==11:
							div=div.replace('http', '\nhttp')
						if estado[0]=="bien":
							descripcion.append([1,div])
						elif estado[0]=="mal":
							descripcion.append([2,div])
						elif i==18:
							dominioAut = re.sub("\D", "", div)
							if dominioAut=="" :
								descripcion.append([3,"No se pudo calcular"])
							elif int(dominioAut)>=90:
								descripcion.append([1,div])
							else:	
								descripcion.append([2,div])
						else:
							descripcion.append([3,div])
						dicc_one[tituloPagina[indice]] = descripcion[indice] 
						indice=indice+1
			for llave, valor in dicc_one.items():
				for item2 in titulosSeleccionados:
					if llave == item2:
						diccionario[llave] = valor
	except (WDE,Exception) as e:
		pass
	return diccionario  
