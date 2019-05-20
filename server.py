
from flask import Flask, render_template, request
from model import *
app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    nasabah = query("SELECT * FROM nasabah")
    mutasi = query("SELECT * FROM mutasi")
    return render_template("dashboard.html", dbdata={'nasabah' : nasabah, 'mutasi': mutasi})

@app.route('/addnasabah', methods=['POST'])
def addnasabah():
    nama = request.form.get('nama')
    saldo = request.form.get('saldo')
    hasil = query("INSERT INTO nasabah (nama, saldo, point) VALUES ('{}','{}', 0)".format(nama, saldo), "post")
    return "{}<br><a href='index'>Back to Dashboard</a>".format(hasil)

@app.route('/deletenasabah', methods=['GET'])
def deletenasabah():
    no = request.args['no']
    hasil = query("DELETE FROM nasabah WHERE no = {}".format(no), "post")
    return "{}<br><a href='index'>Back to Dashboard</a>".format(hasil)

@app.route('/addsaldo', methods=['POST'])
def addsaldo():
    no = request.form.get('id')
    saldo = request.form.get('saldo')
    nasabah = (query('SELECT nama FROM nasabah WHERE no = {} '.format(no),"get"))[0]['nama']
    saldorek = (query('SELECT saldo FROM nasabah WHERE no = {} '.format(no),"get"))[0]['saldo']
    hasil = query('UPDATE nasabah SET saldo={} WHERE no = {} '.format( int(saldo) + int(saldorek), no),"post")
    mutasi = query("INSERT INTO mutasi (activity, debit) VALUES ('Nasabah {} melakukan Pengisian Dana', {})".format(nasabah, saldo),"post")
    return "{}<br><a href='index'>Back to Dashboard</a>".format(hasil)

@app.route('/belipulsa', methods=["POST"])
def belipulsa():
    no = request.form.get('id')
    saldo = int(request.form.get('saldo'))

    cekpulsa = (query('SELECT saldo FROM nasabah WHERE no = {} '.format(no),"get"))[0]['saldo']
    if cekpulsa >= saldo:
        nasabah = (query('SELECT nama FROM nasabah WHERE no = {} '.format(no),"get"))[0]['nama']
        hasil = query('UPDATE nasabah SET saldo={} WHERE no = {} '.format(int(cekpulsa) - int(saldo), no),"post")
        mutasi = query("INSERT INTO mutasi (activity, credit) VALUES ('Nasabah {} melakukan Pengisian Pulsa', {})".format(nasabah, saldo),"post")

        if 20000 <= saldo < 50000:
            cekpoint = (query('SELECT point FROM nasabah WHERE no = {} '.format(no),"get"))[0]['point']
            addpoint = query('UPDATE nasabah SET point={} WHERE no = {} '.format(int(cekpoint) + 1, no),"post")
        elif 50001 <= saldo < 70000:
            cekpoint = (query('SELECT point FROM nasabah WHERE no = {} '.format(no),"get"))[0]['point']
            addpoint = query('UPDATE nasabah SET point={} WHERE no = {} '.format(int(cekpoint) + 2, no),"post")
        elif saldo > 70001:
            cekpoint = (query('SELECT point FROM nasabah WHERE no = {} '.format(no),"get"))[0]['point']
            addpoint = query('UPDATE nasabah SET point={} WHERE no = {} '.format(int(cekpoint) + 3, no),"post")
    else:
        hasil = "Maaf, Saldo anda tidak mencukupi untuk melakukan pembelian pulsa sebesar {}".format(saldo)
    return "{}<br><a href='index'>Back to Dashboard</a>".format(hasil)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=81, debug=True)
