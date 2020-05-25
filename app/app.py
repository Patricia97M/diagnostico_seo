from flask import Flask,make_response
from flask_mysqldb import MySQL
from flask import render_template, request, redirect, url_for
import forms
from datetime import datetime
from flask_wtf.csrf import CSRFProtect
import pdfkit
import scraping as sp 

app = Flask(__name__)

app.config['SECRET_KEY'] = 'asdfghjkl'
csrf = CSRFProtect(app)
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'diagseo2020bd'
app.config['MYSQL_DB'] = 'diagbd'
mysql = MySQL(app)


@app.errorhandler(404)
def page_not_found(e):
    return render_template('404.html')


@app.route('/', methods=["GET", "POST"])
def index():  
    formulario = forms.AnalisisUrl(request.form)
    diccionario={}   
    conn = mysql.connection.cursor()
    conn.execute("SELECT * FROM puntos_seo")
    titulos = conn.fetchall()
    conn.close()
    ahora = datetime.now()
    fecha = ahora.strftime("%Y-%m-%d %H:%M")
    puntos=[]
    if request.method == 'POST' and formulario.validate():
        url = formulario.url.data
        item = request.form.getlist('punto')
        for x in titulos:
            puntos.append(x[1]) #lista de los nombres puntos seo
        if(len(item)==0):
            diccionario = sp.seigo(url,puntos)
        else:
            diccionario = sp.seigo(url,item)
        if "Error" in diccionario:
            return render_template('resultados.html', formulario = formulario, fecha = fecha, titulo=diccionario)
        else:
            conn = mysql.connection.cursor()
            conn.execute("SELECT id_url FROM sitio WHERE url= '%s'"%(url) )
            id = conn.fetchone()
            conn.close()
            if id==None:
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO sitio (url) VALUES ('%s') "%(url))
                mysql.connection.commit()
                cur.close()
            else:
                cur = mysql.connection.cursor()
                cur.execute("DELETE FROM resultado WHERE id_url='%i' "%(id[0]))
                mysql.connection.commit() 
            conn = mysql.connection.cursor()
            conn.execute("SELECT id_url FROM sitio WHERE url= '%s'"%(url) )
            id_url = conn.fetchone()
            conn.close()
            for llave, valor in diccionario.items():
                for item2 in titulos: 
                    if llave in item2:
                        id_punto=item2[0]
                        id_estado=valor[0]
                        if id_estado!=1:
                            valor.append(item2[3])
                            valor.append(item2[0])
                        cur2 = mysql.connection.cursor()
                        cur2.execute("INSERT INTO resultado (id_url,id_punto,id_estado) VALUES ('%i','%i','%i') "%(id_url[0],id_punto,id_estado))
                        mysql.connection.commit()
            return render_template('resultados.html', formulario = formulario, fecha = fecha, titulo=diccionario, url=url)     
    else:
        return render_template('index.html',formulario = formulario, titulos=titulos)

@app.route('/informe',methods=["POST"])
def informe():
    if request.method == 'POST':
        titulo = request.form['descargar']
        fecha1 = request.form['fecha']
        url = request.form['url']
        dicc=eval(titulo)
        rendered=render_template('informe.html', titulo=dicc, fecha=str(fecha1), url=str(url))
        pdf = pdfkit.from_string(rendered, False)
        response = make_response(pdf)
        response.headers['Contend-Type'] = 'applicacion/pdf'
        response.headers['Content-Disposition'] = 'attachment; filename=informe.pdf' 
    
        return response
    else:
        return redirect(url_for('index'))

