CREATE DATABASE suicide_mental_health_db;
USE suicide_mental_health_db;

-- Create tables for raw data to be loaded into MySQL Workbench
CREATE TABLE countries_suicides (
  id INT PRIMARY KEY,
  country TEXT,
  suicides_no TEXT,
  population TEXT,
  percentage TEXT
);
ALTER TABLE countries_suicides CHANGE suicides_no suicides_no INT NOT NULL;

CREATE TABLE years_suicides (
  id INT PRIMARY KEY,
  year TEXT,
  suicides_no TEXT,
  population TEXT,
  percentage TEXT
);

DROP TABLE ages_suicides;
CREATE TABLE ages_suicides (
  id INT PRIMARY KEY,
  age TEXT,
  suicides_no TEXT,
  population TEXT,
  percentage TEXT
);
ALTER TABLE ages_suicides CHANGE suicides_no suicides_no INT NOT NULL;

DROP TABLE gender_suicides;
CREATE TABLE gender_suicides (
  id INT PRIMARY KEY,
  sex TEXT,
  suicides_no TEXT,
  population TEXT,
  percentage TEXT
);

DROP TABLE countries_mental;
CREATE TABLE countries_mental (
  id INT PRIMARY KEY,
  country TEXT,
  self_employed TEXT,
  remote_work TEXT,
  family_history TEXT,
  treatment TEXT,
  seek_help TEXT
);

CREATE TABLE years_mental (
  id INT PRIMARY KEY,
  year TEXT,
  self_employed TEXT,
  remote_work TEXT,
  family_history TEXT,
  treatment TEXT,
  seek_help TEXT
);

CREATE TABLE ages_mental (
  id INT PRIMARY KEY,
  age TEXT,
  self_employed TEXT,
  remote_work TEXT,
  family_history TEXT,
  treatment TEXT,
  seek_help TEXT
);

DROP TABLE gender_mental;
CREATE TABLE gender_mental (
  id INT PRIMARY KEY,
  sex TEXT,
  self_employed TEXT,
  remote_work TEXT,
  family_history TEXT,
  treatment TEXT,
  seek_help TEXT
);

-- Joins the tables by years from suicides date and mental data
SELECT years_suicides.year,suicides_no, population, percentage,
	   self_employed,remote_work, family_history,
       treatment, seek_help
FROM years_suicides
JOIN years_mental
ON years_suicides.id = years_mental.id;

-- Joins the tables by ages from suicides date and mental data
SELECT ages_suicides.age,suicides_no, population, percentage,
	   self_employed,remote_work, family_history,
       treatment, seek_help
FROM ages_suicides
JOIN ages_mental
ON ages_suicides.id = ages_mental.id
ORDER BY suicides_no DESC;

-- Joins the tables by gender from suicides date and mental data
SELECT gender_suicides.sex,suicides_no, population, percentage,
	   self_employed,remote_work, family_history,
       treatment, seek_help
FROM gender_suicides
JOIN gender_mental
ON gender_suicides.id = gender_mental.id;


-- Inner Joins the tables by country from suicides date and mental data
SELECT countries_suicides.country,suicides_no, population, percentage,
	   self_employed,remote_work, family_history,
       treatment, seek_help
FROM countries_suicides
Inner JOIN countries_mental
ON countries_suicides.country = countries_mental.country
ORDER BY countries_suicides.suicides_no DESC;
