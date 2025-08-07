DROP FUNCTION IF EXISTS sp_latest_book();

CREATE OR REPLACE FUNCTION sp_latest_book()
RETURNS TABLE (
    title TEXT,
    publish_date DATE
)
LANGUAGE sql
AS $$
    SELECT b.title, b.publish_date
    FROM books b
    ORDER BY b.publish_date DESC
    LIMIT 1;
$$;


SELECT * FROM sp_latest_book();
