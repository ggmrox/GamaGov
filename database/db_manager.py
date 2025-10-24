import sqlite3

DB_NAME = "pregoes.db"

def conectar():
    return sqlite3.connect(DB_NAME)

def insert_contracts(number, year, client, item, supplier, quantity, cost, price, expiration_date):
    with conectar() as conn:
        conn.execute(
            """INSERT INTO contracts ("number", "year", "item", "supplier", "client", "quantity", "cost", "price", "expiration_date")
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);""", (number, year, client, item, supplier, quantity, cost, price, expiration_date)
            )
        conn.commit()




