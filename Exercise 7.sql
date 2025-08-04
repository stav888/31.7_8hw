DROP TABLE IF EXISTS books, authors;

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT,
    price DOUBLE PRECISION,
    publish_date DATE,
    author_id INT REFERENCES authors(id)
);


INSERT INTO authors (name) VALUES 
    ('Alice Munro'),
    ('George Orwell'),
    ('Haruki Murakami'),
    ('Chimamanda Ngozi Adichie');

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


CREATE OR REPLACE FUNCTION sp_latest_book()
RETURNS TABLE (
    title TEXT,
    publish_date DATE
)
LANGUAGE sql
AS $$
    SELECT 
        b.title,
        b.publish_date
    FROM books b
    ORDER BY b.publish_date DESC
    LIMIT 1;
$$;


SELECT * FROM sp_latest_book();
