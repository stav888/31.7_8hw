DROP FUNCTION IF EXISTS greet_user(TEXT);

CREATE OR REPLACE FUNCTION greet_user(name TEXT)
RETURNS TEXT 
LANGUAGE plpgsql AS
$$
BEGIN
    RETURN 'Hello ' || name || '! The time is ' || CURRENT_TIMESTAMP;
END;
$$;

SELECT greet_user('Alex');
