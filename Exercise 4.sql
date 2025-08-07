CREATE OR REPLACE FUNCTION div_mod(a DOUBLE PRECISION, b DOUBLE PRECISION, OUT quotient DOUBLE PRECISION, OUT remainder DOUBLE PRECISION)
LANGUAGE plpgsql AS
$$
BEGIN
    quotient := a / b;
    remainder := a - (quotient * b);
END;
$$;

SELECT * FROM div_mod(17, 5);
