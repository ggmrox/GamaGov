import sqlite3
from tkinter import messagebox

DB_NAME = "pregoes.db"

def conectar():
    return sqlite3.connect(DB_NAME)

def insert_contracts(number, year, client, item, supplier, quantity, cost, price, expiration_date):
    try:    
        with conectar() as conn:
            conn.execute(
                """INSERT INTO contracts ("number", "year", "client", "item", "supplier", "quantity", "cost", "price", "expiration_date")
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);""", (number, year, client, item, supplier, quantity, cost, price, expiration_date)
                )
            conn.commit()
        
        messagebox.showinfo("Sucesso", "Contrato inserido com sucesso!")

    except sqlite3.IntegrityError as erro:
        error_msg = str(erro)

        if "year" in error_msg:
            messagebox.showerror("Year Field", "Must be a Year in format: YYYY")
            raise

        elif "expiration_date" in error_msg:
            messagebox.showerror("Expiration Date Field", "Must be a Year in format: YYYY-MM-DD")
            raise

        elif any(word in error_msg for word in ["number", "quantity", "cost", "price"]):
            messagebox.showerror("Numeric Fields", "Number, Quant, Cost and Price must be bigger than zero!")
            raise

        else:
            messagebox.showerror("Erro Inesperado", "Erro não identificado. Contate o suporte")
            raise
    




