CREATE OR REPLACE FUNCTION greet_user(name TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN 'Hello ' || name || '! The time is ' || CURRENT_TIMESTAMP;
END;
$$ LANGUAGE plpgsql;
