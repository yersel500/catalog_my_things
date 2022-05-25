CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    publisher VARCHAR(100) NOT NULL,
    cover_state VARCHAR(100) NOT NULL,
    CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id)
);

INSERT INTO labels (title, color) VALUES ('Gift', 'blue');
INSERT INTO labels(title, color) VALUES ('New', 'green');

INSERT INTO books (genre, author, label_id, publish_date, archived, publisher, cover_state) VALUES ('finance', 'Robert', 1, DATE '2022-01-05', false,'mcgrill', 'good');

INSERT INTO books (genre, author, label_id, publish_date, archived, publisher, cover_state) VALUES('fiction', 'Maya', 2, DATE '2020-05-09', true,'star', 'bad');

