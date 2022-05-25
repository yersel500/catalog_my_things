CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE NOT NULL,
    archived BOOLEAN NOT NULL,
    on_spotify BOOLEAN NOT NULL
    CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id)
    CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genres(id)
    CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES authors(id)
);

INSERT INTO genres (name) VALUES ('Rock');
INSERT INTO genres(name) VALUES ('Metal');

INSERT INTO music_albums (genre_id, author_id, label_id, publish_date, archived, on_spotify) VALUES (0, 1, 1, '2022-01-05', false, true);
INSERT INTO music_albums (genre_id, author_id, label_id, publish_date, archived, on_spotify) VALUES(1, 1, 1, '2020-05-09', true, true);
