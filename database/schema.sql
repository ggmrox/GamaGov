
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

CREATE TABLE contract_logs (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "action" TEXT NOT NULL,
    "contract_id" INTEGER NOT NULL,
    "date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("contract_id") REFERENCES contracts("id")
);

CREATE TRIGGER "contract_delete"
AFTER DELETE ON contracts
FOR EACH ROW
BEGIN
    INSERT INTO contract_logs ("action", "contract_id", "date")
    VALUES ('DELETE', OLD."id", CURRENT_TIMESTAMP);
END;

CREATE TRIGGER "contract_insert"
AFTER INSERT ON contracts
FOR EACH ROW
BEGIN
    INSERT INTO contract_logs ("action", "contract_id", "date")
    VALUES ('INSERT', NEW."id", CURRENT_TIMESTAMP);
END;

CREATE TRIGGER "contract_update"
AFTER UPDATE ON contracts
FOR EACH ROW
BEGIN
    INSERT INTO contract_logs ("action", "contract_id", "date")
    VALUES ('UPDATE', NEW."id", CURRENT_TIMESTAMP);
END;


