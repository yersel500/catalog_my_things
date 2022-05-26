CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    color VARCHAR(100) NOT NULL
);

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    on_spotify BOOLEAN NOT NULL
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id)
    CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id)
    CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES authors(id)
);

DROP TABLE IF EXISTS author;
CREATE TABLE author (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL
    last_name VARCHAR(100) NOT NULL
)

DROP TABLE IF EXISTS  game;
CREATE TABLE game(
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date    DATE NOT NULL,
    archived        BOOLEAN NOT NULL,
    last_played_at  DATE NOT NULL,
	multiplayer     BOOLEAN NOT NULL,
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id)
    CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id)
    CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES authors(id)
);

INSERT INTO genres (name) VALUES ('Rock');
INSERT INTO genres(name) VALUES ('Metal');

INSERT INTO music_albums (genre_id, author_id, label_id, publish_date, archived, on_spotify) VALUES (1, 2, 1, '2022-01-05', false, true);
INSERT INTO music_albums (genre_id, author_id, label_id, publish_date, archived, on_spotify) VALUES(1, 1, 1, '2020-05-09', true, true);

INSERT INTO author (first_name, last_name) VALUES ('Thiago', 'Ponce');
INSERT INTO game (genre_id, author_id, label_id, publish_date, archived, last_played_at, multiplayer) VALUES (1, 1, 1,'2005-01-01', false, '2022-05-01', true)

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    publisher VARCHAR(100) NOT NULL,
    cover_state VARCHAR(100) NOT NULL,
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id)
    CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id)
    CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES authors(id)
);

INSERT INTO labels (title, color) VALUES ('Gift', 'blue');
INSERT INTO labels(title, color) VALUES ('New', 'green');

INSERT INTO books (genre_id, author_id, label_id, publish_date, archived, publisher, cover_state) VALUES (1, 2, 1, DATE '2022-01-05', false,'mcgrill', 'good');

INSERT INTO books (genre, author, label_id, publish_date, archived, publisher, cover_state) VALUES(1, 1, 2, DATE '2020-05-09', true,'star', 'bad');