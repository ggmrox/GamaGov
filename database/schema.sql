
CREATE TABLE contracts (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL CHECK("number" > 0),
    "year" INTEGER NOT NULL,
    "client" TEXT NOT NULL,
    "item" TEXT NOT NULL,
    "supplier" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    "cost" NUMERIC NOT NULL CHECK("cost" > 0),
    "price" NUMERIC NOT NULL CHECK("price" > 0),
    "expiration_date" TEXT NOT NULL CHECK("expiration_date" GLOB '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
);



