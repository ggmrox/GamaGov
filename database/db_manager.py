import sqlite3

DB_NAME = "pregoes.db"

def conectar():
    return sqlite3.connect(DB_NAME)

def inserir_dados(numero, orgao):
    with conectar() as conn:
        conn.execute(
            "INSERT INTO pregoes (numero, orgao) VALUES (?, ?)",
            (numero, orgao)
        )
        conn.commit()


