import tkinter as tk
from tkinter import messagebox
from database import db_manager



# Tags for the main window - Easy to modify #
tags = [
    "Contract Number", 
    "Year",
    "Client", 
    "Item", 
    "Supplier", 
    "Quantity", 
    "Cost", 
    "Price", 
    "Expiration Date"
]

class Main_Window(tk.Tk):
    
    # Initiating object with main characteristics #
    def __init__(self):
        super().__init__()
        self.title("GAMACORP - CONTROLE DE ATAS")
        self.geometry("400x400")
        self.option_add("*Font", ("Calibri", 14))

        # List for storing user inputs #

        self.inputs = []

        # Loop to use all the values from "tags" #

        for index, tag in enumerate(tags):
            tk.Label(self, text=tag).grid(row=index, column=0, padx=5, pady=3)
            entry = tk.Entry(self)
            entry.grid(row=index, column=1, padx=5, pady=3)
            self.inputs.append(entry)        

        tk.Button(self, text="Enviar", command=self.on_submit).grid(row=(len(tags)), column=0, columnspan=2, pady=20, sticky="we")

    def on_submit(self):

        # Confirmation before submiting / for loop to iterate in the inputs list / Insert queries / Delete input fields #
        values = [entry.get().strip() for entry in self.inputs]

        if any(v == "" for v in values):
            messagebox.showerror("Error", "Input info in all fields before submiting!")

        else:
            confirm = messagebox.askquestion("Confirmation", "Are you sure you want to SUBMIT?")
            if confirm == "yes":
                try:
                    db_manager.insert_contracts(*values)
                    
                    for entry in self.inputs:
                        entry.delete(0, tk.END)

                except Exception:
                    return

            elif confirm == "no":
                messagebox.showerror("Cancelamento", "Informação cancelada!")
        



    