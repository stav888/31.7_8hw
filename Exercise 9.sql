CREATE OR REPLACE FUNCTION sp_books_by_year_range(
    from_year INT,
    to_year INT
)
RETURNS TABLE (
    id INT,
    title TEXT,
    publish_date DATE,
    price DOUBLE PRECISION
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.id,
        b.title,
        b.publish_date,
        b.price
    FROM
        books b
    WHERE
        EXTRACT(YEAR FROM b.publish_date) BETWEEN from_year AND to_year
    ORDER BY
        b.publish_date;
END;
$$;


SELECT * FROM sp_books_by_year_range(2000, 2015);
