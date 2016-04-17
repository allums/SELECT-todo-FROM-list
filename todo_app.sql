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