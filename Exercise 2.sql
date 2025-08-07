DROP FUNCTION IF EXISTS create_orders_table();

CREATE OR REPLACE PROCEDURE create_orders_table()
LANGUAGE plpgsql
AS $$
BEGIN
    CREATE TABLE IF NOT EXISTS orders (
        id SERIAL PRIMARY KEY,
        customer_name TEXT NOT NULL,
        amount DOUBLE PRECISION NOT NULL
    );
END;
$$;

CALL create_orders_table();
