# 🧾 GamaGov - Contract Management System

**GamaGov** is a desktop application built with **Python (Tkinter)** and **SQLite3** for managing data from *electronic public contracts*.  
It provides a simple and intuitive interface for inserting, validating, and storing contract information in a local database.

---

## 🧰 Tech Stack

- **Language:** Python
- **GUI Framework:** Tkinter
- **Database:** SQLite3
- **File Architecture:** Modular (separated `interface.py` and `db_manager.py`)
- **Packaging:** PyInstaller (`.exe` generated for easy use)

---

## 📂 Project Structure

```text

GamaGov/
│
├── database/
│ ├── schema.sql # Database schema (tables and constraints)
│ ├── db_manager.py # Handles database connection and CRUD operations
│ └── pregoes.db # Local SQLite database (auto-created on first run)
│
├── gui/
│ ├── interface.py # Tkinter graphical interface (main window, inputs, buttons)
│
├── main.py # App entry point

```

---

## 🚀 Features

✅ **Modern GUI built with Tkinter**  
A simple, responsive interface for fast data entry.

✅ **Automatic database integration**  
All data inserted through the interface is stored locally in `pregoes.db` using SQLite3.

✅ **Strong field validation**
- Empty field detection before submission  
- Numeric and date validation before submission
- SQLite constraints ensure data integrity

✅ **Error handling with user-friendly messages**
- Detailed error feedback through `messagebox.showerror`  
- Custom messages for each constraint (`CHECK`, `NOT NULL`, etc.)  
- Prevents field clearing when submission fails

✅ **Success feedback**
- Confirmation box before submitting  
- “Success” messages only shown when insertions are validated and committed
- "Errors" messages show when something goes wrong

✅ **Executable build support**
- Easily converted to `.exe` via `PyInstaller`
- Example:  
  pyinstaller --onefile --windowed --icon=icon.ico main.py

---

## 🗃️ Database Schema

The app uses only one table for now, but can be upgraded to multiple related tables with integrity constraints:

```sql
CREATE TABLE contracts (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL CHECK("number" > 0),
    "year" TEXT NOT NULL CHECK("year" GLOB '[0-9][0-9][0-9][0-9]'),
    "client" TEXT NOT NULL,
    "item" TEXT NOT NULL,
    "supplier" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    "cost" NUMERIC NOT NULL CHECK("cost" > 0),
    "price" NUMERIC NOT NULL CHECK("price" > 0),
    "expiration_date" TEXT NOT NULL CHECK("expiration_date" GLOB '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
);
```

---

🧩 Application Workflow

User opens the app
- Tkinter GUI is displayed (interface.py).

User fills all fields
- The app validates empty or invalid values (on_submit() function).
- User clicks "Submit" button

Message Box shows up asking for confirmation to submit
- User clicks Yes: submits and clears fields
- User clicks No: cancel the operation and goes back to GUI, mantaining the values on the fields

The app calls:

db_manager.insert_contracts(*values) - Database layer (db_manager.py)

- Executes the INSERT query
- Handles integrity errors and constraint violations

On success
- The database commits the transaction
- A success message is displayed
- Input fields are cleared automatically

On errors
- Displays friendly error messages telling what field is invalid
- Raises errors back to the interface if insertion fails

---

🧮 Future Improvements

- Add UPDATE and DELETE operations
- Implement search/filter function by contract number or supplier
- Add export to CSV option
- Multi-language support (EN/PT-BR toggle)
- Improved date picker widget instead of manual date typing

---

🧑‍💻 Author

Gabriel Maldaner  
📍 Campinas, São Paulo, Brazil  
💼 Background: Public Procurement & Data Analysis  
📧 Contact: https://github.com/ggmrox

---

🪄 License

This project is licensed under the MIT License — feel free to use, modify, and distribute it for educational or commercial purposes.




