-- Create the procedure to set up and populate the database
CREATE OR REPLACE PROCEDURE prepare_books_db()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Create the authors table
    CREATE TABLE IF NOT EXISTS authors (
        id SERIAL PRIMARY KEY,
        name TEXT NOT NULL
    );

    -- Create the books table
    CREATE TABLE IF NOT EXISTS books (
        id SERIAL PRIMARY KEY,
        title TEXT,
        price DOUBLE PRECISION,
        publish_date DATE,
        author_id INT REFERENCES authors(id)
    );

    -- Insert authors
    INSERT INTO authors (name) VALUES
    ('Alice Munro'),
    ('George Orwell'),
    ('Haruki Murakami'),
    ('Chimamanda Ngozi Adichie');

    -- Insert books
    INSERT INTO books (title, price, publish_date, author_id) VALUES
    ('Lives of Girls and Women', 45.0, '1971-05-01', 1),
    ('1984', 30.0, '1949-06-08', 2),
    ('Norwegian Wood', 50.0, '1987-09-04', 3),
    ('Half of a Yellow Sun', 42.5, '2006-08-15', 4),
    ('Kafka on the Shore', 55.0, '2002-01-01', 3),
    ('Dear Life', 48.0, '2012-11-13', 1),
    ('The Thing Around Your Neck', 35.0, '2009-04-01', 4),
    ('Animal Farm', 28.0, '1945-08-17', 2),
    ('The Testaments', 60.0, '2019-09-10', 2),
    ('Colorless Tsukuru Tazaki', 47.5, '2013-04-12', 3);
END;
$$;

-- Create the function to retrieve book information
CREATE OR REPLACE FUNCTION sp_get_books_with_year()
RETURNS TABLE (title TEXT, publish_year INT, price DOUBLE PRECISION)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.title,
        EXTRACT(YEAR FROM b.publish_date) AS publish_year,
        b.price
    FROM
        books b;
END;
$$;


CALL prepare_books_db();
SELECT * FROM sp_get_books_with_year();
