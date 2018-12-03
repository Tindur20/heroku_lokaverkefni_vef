from sys import argv
from bottle import *
import pymysql
import bottle
import os


@route('/')
def index():
    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
    c = conn.cursor()
    c.execute('SELECT story FROM 2811992349_lokaverkefni_vefth.news')
    result = c.fetchall()
    c.close()
    output = template('index.tpl', rows = result)
    return output

@route('/admin')
def ritstjorn():
    return template('admin.tpl')

@route('/nyfrett', method='POST')
def nyfrett():
    i = request.forms.get('ID')
    s = request.forms.get('story')
    a = request.forms.get('author')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
    cur = conn.cursor()

    cur.execute("SELECT count(*) FROM 2811992349_lokaverkefni_vefth.users where author = %s",(a))
    result = cur.fetchone()

    if result[0] == 1:
        cur.execute("INSERT INTO 2811992349_lokaverkefni_vefth.news Values(%s,%s,%s)",(i, s, a))
        conn.commit()
        cur.close()
        conn.close()

        return "<h1>", a ," ný frétt hefur verið skráð <br><a href='/'>Aftur á forsíðu</a></h1>"
    else:
        return template('ekkiLeyni.tpl')

@route('/doinnskra', method='POST')
def leyni():
    u = request.forms.get('author')
    p = request.forms.get('pass')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
    cur = conn.cursor()

    cur.execute("SELECT count(*) FROM 2811992349_lokaverkefni_vefth.users where author = %s and pass = %s",(u, p))
    result = cur.fetchone()
    print(result)
    # er u og til í db?
    if result[0] == 1:
        cur.close()
        conn.close()
        return template('ritstjorn.tpl', a=u)
    else:
        return template('ekkiLeyni.tpl')

@route('/breyta_frett',method='POST')
def get_author():
    a = request.forms.get('author')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
    cur = conn.cursor()

    cur.execute("SELECT * FROM 2811992349_lokaverkefni_vefth.news WHERE author=%s",(a))
    result = cur.fetchall()

    conn.commit()
    cur.close()
    conn.close()
    return template('breyta_frett.tpl', cur = result, a=a)

@route('/breyta', method='POST')
def edit_story():
    i = request.forms.get('ID')
    s = request.forms.get('story')
    a = request.forms.get('Author')

    conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
    cur = conn.cursor()

    button = request.forms.get('breytan')
    if button == 'Breyta':
        conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
        cur = conn.cursor()
        cur.execute("UPDATE 2811992349_lokaverkefni_vefth.news set story='{}' WHERE ID='{}'".format(s,i))
        conn.commit()
        cur.close()
        conn.close()
        redirect('/')
    else:
        conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='2811992349', passwd='mypassword', db='2811992349_lokaverkefni_vefth')
        cur = conn.cursor()
        cur.execute("DELETE FROM 2811992349_lokaverkefni_vefth.news WHERE ID='{}'".format(i))
        conn.commit()
        cur.close()
        conn.close()
        redirect('/')


@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')

#run(host='localhost', port=8800, debug = True, reloader=True)

bottle.run(host='0.0.0.0', port=argv[1]) #Þetta þarf að vera í gangi til að heruko serverinn mun virka
