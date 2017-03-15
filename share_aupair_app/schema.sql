CREATE TABLE clients (
    id SERIAL4 PRIMARY KEY,
  name VARCHAR(600) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(10) NOT NULL,
  password VARCHAR(100) NOT NULL,
  img_url TEXT,
  children VARCHAR(600),
  children_age_0to1 BOOLEAN,
  children_age_2to3 BOOLEAN,
  children_age_3to5 BOOLEAN,
  children_age_6to8 BOOLEAN,
  children_age_9to12 BOOLEAN,
  children_age_12plus BOOLEAN,
  street_address VARCHAR(1000),
  suburb VARCHAR(100),
  bio VARCHAR(5000),
  host BOOLEAN
);

CREATE TABLE carers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(600) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(10) NOT NULL,
  password VARCHAR(100) NOT NULL,
  img_url TEXT,
  age INTEGER,
  street_address VARCHAR(1000),
  suburb VARCHAR(100),
  children_age_0to1 BOOLEAN,
  children_age_2to3 BOOLEAN,
  children_age_3to5 BOOLEAN,
  children_age_6to8 BOOLEAN,
  children_age_9to12 BOOLEAN,
  children_age_12plus BOOLEAN,
  bio VARCHAR(5000),
  blue_card BOOLEAN
);

CREATE TABLE locations (
  id SERIAL4 PRIMARY KEY,
  postcode VARCHAR(4) NOT NULL,
  suburb VARCHAR(100) NOT NULL,
  region VARCHAR(100) NOT NULL
);
