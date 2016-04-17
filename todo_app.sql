-- drop michael if exists

DROP USER IF EXISTS michael;

--1. Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

--Write a query to drop a database named `todo_app` if it exists

DROP DATABASE IF EXISTS todo_app;

--Write a query to create a database named `todo_app`

CREATE DATABASE todo_app;

--Connect to the newly created database

\c todo_app;

-- Write a query to create a table named `tasks` using the **Initial columns** detailed below

CREATE TABLE tasks (

  id SERIAL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at timestamp NOT NULL DEFAULT NOW(),
  updated_at timestamp NULL,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

INSERT INTO tasks (title, description, created_at, updated_at, completed) VALUES ('Study SQL', 'Complete this exercise', now());

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT * FROM tasks WHERE completed_at IS NULL;

INSERT INTO tasks (title) VALUES ('Study SQL');

SELECT title, description FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at=now() WHERE title='Study SQL';

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description) VALUE ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUE ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) VALUE ('mistake 3', 'another test entry');

SELECT * FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title='mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT FROM tasks ORDER BY title ASC;