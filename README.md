# Herramienta Diagnóstico seo

Esta herramienta esta creada con el framework de python llamado flask, a continuacion se detalla su intalación en docker.

## Precondición

Debe tener instalado docker y docker-compose

## Archivo docker-compose

Clonamos el siguiente repositorio github en el equipo e ingresamos a la carpeta:

		$ git clone https://github.com/Patricia97M/diagnostico_seo.git 
    	$ cd diagnostico_seo
  
Es una herramienta para definir y ejecutar aplicaciones Docker de múltiples contenedores. Utiliza un archivo Compose para configurar los servicios de su aplicación, en este caso configuraremos el contenedor flask (/app/Dockerfile) de contiene la aplicacion , Nginx (/nginx/Dockerfile) como servidor web para esta herramienta y Mysql como base de datos inicializando la base de datos correspondiente en el siqgiente archivo `docker-compose.yml` 

    version: "3.7"
    services:
 
      flask:
        build: ./app
        container_name: flask
        restart: always
        environment:
          - APP_NAME=MyFlaskApp
        command :  gunicorn --bind 0.0.0.0:5000 --timeout 1000 app:app daemon
        expose:
          - 5000
        links:
          - db

      db:
        image: mysql:5.7
        container_name: db
        environment: 
          MYSQL_ROOT_PASSWORD: diagseo2020bd          # clave del super usuario root de la base de datos
          MYSQL_DATABASE: diagbd                      # nombre de la base de datos
        ports: 
          - "32000:3306"
        volumes:
          - ./db:/docker-entrypoint-initdb.d/:ro


      nginx:
        build: ./nginx
        container_name: nginx
        restart: always
        ports:
          - "80:80"


Usamos los siguientes comando para crear las imagenes y levantar los contenedores

    $ sudo docker-compose build
    $ sudo docker-compose up -d
    
Comprobamos que hemos generado las nuevas imagenes:

	  $ sudo docker images
  
Comprobamos que los contenedores estan corriendo
 
     $ sudo docker ps
         
La configuración de la conexión a la base de datos de nuestra aplicación, esta en el fichero `app.py` aqui se indican los parámetros de conexión y la contraseña del root de mysql que vamos a mandar cuando creemos el contenedor, de la siguiente manera:

    app.config['MYSQL_HOST'] = 'db'			            # IP del servidor o nombre del servicio
    app.config['MYSQL_USER'] = 'root'			            # Nombre de usuario
    app.config['MYSQL_PASSWORD'] = 'diagseo2020bd'		    # Contraseña
    app.config['MYSQL_DB'] = 'diagbd'			            # Nombre de la base de datos


## Acceso

    http://localhost
