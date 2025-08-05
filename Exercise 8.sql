CREATE OR REPLACE FUNCTION sp_books_summary(
    OUT youngest_book DATE,
    OUT oldest_book DATE,
    OUT avg_price NUMERIC(5, 2),
    OUT total_books INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Calculate the most recent publish date
    SELECT MAX(publish_date) INTO youngest_book FROM books;

    -- Calculate the oldest publish date
    SELECT MIN(publish_date) INTO oldest_book FROM books;

    -- Calculate the average price
    SELECT AVG(price) INTO avg_price FROM books;

    -- Calculate the total number of books
    SELECT COUNT(*) INTO total_books FROM books;
END;
$$;


SELECT * FROM sp_books_summary();
