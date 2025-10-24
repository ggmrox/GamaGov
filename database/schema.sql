CREATE TABLE contract (
    "id" INTEGER,
    "number" INTEGER NOT NULL CHECK("number" > 0),
    "ano" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "supplier_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL CHECK("quantity" > 0),
    "type" TEXT NOT NULL,
    "cost" NUMERIC NOT NULL CHECK("cost" > 0),
    "sold" NUMERIC NOT NULL CHECK("cost" > 0),
    "expiration_date" TEXT NOT NULL CHECK("expiration_date" GLOB '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
    PRIMARY KEY("id"),
    FOREIGN KEY("item_id") REFERENCES item."id",
    FOREIGN KEY("supplier_id") REFERENCES supplier."id"
);

CREATE TABLE item (
    "id" INTEGER,
    "comercial_name" TEXT NOT NULL,
    "pharma_name" TEXT NOT NULL,
    "supplier_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("supplier_id") REFERENCES supplier."id"
);

CREATE TABLE supplier (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);