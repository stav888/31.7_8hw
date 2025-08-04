CREATE OR REPLACE FUNCTION div_mod(a DOUBLE PRECISION, b DOUBLE PRECISION, OUT quotient DOUBLE PRECISION, OUT remainder DOUBLE PRECISION)
AS $$
BEGIN
    quotient := a / b;
    remainder := a - (quotient * b);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM div_mod(17, 5);
