
import mysql.connector

def query(sql, mode="get"):
    db      = mysql.connector.connect(host="localhost",user="root",passwd="", database="db_accounting")
    cursor  = db.cursor(dictionary=True)
    cursor.execute(sql)
    if mode == "get":
        return cursor.fetchall()
    else:
        db.commit()
        return str(cursor.rowcount) + " records affected"
    db.close()
