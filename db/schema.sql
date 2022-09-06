-- drop database catalo-of-things if it is aready created
DROP DATABASE IF EXISTS catalog_of_things; 
 -- create catalog_of_things database
CREATE DATABASE catalog_of_things;

/*  Drop tables if exists */

-- drop authors table 
DROP TABLE  IF EXISTS authors;

--create authors table

 CREATE TABLE authors (id  INT GENERATED ALWAYS AS IDENTITY, first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255)  NOT NULL,  CONSTRAINT pk_authors PRIMARY KEY(id)
 )

-- Drop table genres if exists 
 DROP TABLE IF EXISTS genres;

 -- create table genres 
 CREATE TABLE genres(id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255) NOT NULL,
CONSTRAINT pk_genres PRIMARY KEY(id)
  )

-- Drop table sources if exists
 DROP TABLe IF exists sources
 -- create table sources

 CREATE TABLE sources( id INT GENERATED ALWAYS AS IDENTITY,
 name VARCHAR(255) NOT NULL,ONSTRAINT pk_sources PRIMARY KEY(id)
  )
 
-- drop table labels if exists
 DROP TABLe IF exists labels
 -- create table labels 
   CREATE TABLE labels( id INT GENERATED ALWAYS AS IDENTITY,title VARCHAR(255) NOT NULL,
    color VARCHAR(100) NOT NULL, CONSTRAINT pk_labels PRIMARY KEY(id)
  )

  -- Drop table books if exists
DROP TABLE IF EXISTS books
  -- create table books 

CREATE TABLE books (id INT GENERATED ALWAYS AS IDENTITY, publisher VARCHAR(100), cover_state VARCHAR(100),
publish_date  DATE, archived BOOLEAN, author_id INT, genre_id INT,
label_id INT, source_id INT,
CONSTRAINT pk_books PRIMARY KEY(id),
CONSTRAINT fk_authors FOREIGN KEY(author_id) REFERENCES authors(id),
CONSTRAINT fk_geners FOREIGN KEY(genre_id) REFERENCES genres(id),
CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
CONSTRAINT fk_sources FOREIGN KEY(source_id) REFERENCES sources(id)
)
-- Drop table movies if exists 
DROP TABLE IF EXISTS movies

-- create tables movies 


CREATE TABLE movies ( id INT GENERATED ALWAYS AS IDENTITY,
silent BOOLEAN, publish_date  DATE, archived BOOLEAN,
author_id INT, genre_id INT,label_id INT, source_id INT,
CONSTRAINT pk_movies PRIMARY KEY(id),
CONSTRAINT fk_authors FOREIGN KEY(author_id)  REFERENCES authors(id),
CONSTRAINT fk_geners FOREIGN KEY(genre_id) REFERENCES genres(id),
CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
CONSTRAINT fk_sources FOREIGN KEY(source_id) REFERENCES sources(id)

)
-- Drop table games if exists
DROP TABLE IF EXISTS games
--create table games 

CREATE TABLE games ( id INT GENERATED ALWAYS AS IDENTITY, multiplayer BOOLEAN,
 last_played_at DATE, publish_date  DATE, archived BOOLEAN,
author_id INT, genre_id INT, label_id INT, source_id INT,
CONSTRAINT pk_games PRIMARY KEY(id),
CONSTRAINT fk_authors FOREIGN KEY(author_id)  REFERENCES authors(id),
CONSTRAINT fk_geners FOREIGN KEY(genre_id) REFERENCES genres(id),
CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
CONSTRAINT fk_sources FOREIGN KEY(source_id) REFERENCES sources(id)

)
 -- Drop table music_albums if exists
DROP TABLE IF EXISTS music_albums
 -- create table music_albums

 CREATE TABLE music_albums ( id INT GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
publish_date  DATE, archived BOOLEAN, author_id INT,
genre_id INT, label_id INT, source_id INT,
CONSTRAINT pk_music_albums PRIMARY KEY(id),
CONSTRAINT fk_authors FOREIGN KEY(author_id)  REFERENCES authors(id),
CONSTRAINT fk_geners FOREIGN KEY(genre_id) REFERENCES genres(id),
 CONSTRAINT fk_labels FOREIGN KEY(label_id) REFERENCES labels(id),
CONSTRAINT fk_sources FOREIGN KEY(source_id) REFERENCES sources(id)

)

  
   