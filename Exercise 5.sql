CREATE OR REPLACE FUNCTION sp_math_roots(
    x DOUBLE PRECISION,
    y DOUBLE PRECISION,
    OUT sum_result DOUBLE PRECISION,
    OUT diff_result DOUBLE PRECISION,
    OUT sqrt_x DOUBLE PRECISION,
    OUT y_power_4 DOUBLE PRECISION
)
LANGUAGE plpgsql AS
$$
BEGIN
    sum_result := x + y;
    diff_result := x - y;
    sqrt_x := sqrt(x);
    y_power_4 := POWER(y, 4);
END;
$$;


SELECT * FROM sp_math_roots(16, 2);
