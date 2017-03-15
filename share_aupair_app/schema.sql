CREATE TABLE clients (
    id SERIAL4 PRIMARY KEY,
  name VARCHAR(600) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(10) NOT NULL,
  img_url TEXT,
  children VARCHAR(600) NOT NULL,
  children_age INTEGER NOT NULL,
  street_address VARCHAR(1000) NOT NULL,
  suburb VARCHAR(100) NOT NULL,
  host BOOLEAN NOT NULL
);

CREATE TABLE carers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(600) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(10) NOT NULL,
  img_url TEXT NOT NULL,
  age INTEGER NOT NULL,
  street_address VARCHAR(1000) NOT NULL,
  blue_card BOOLEAN NOT NULL  
);

CREATE TABLE locations (
  id SERIAL4 PRIMARY KEY,
  postcode VARCHAR(4) NOT NULL,
  suburb VARCHAR(100) NOT NULL,
  region VARCHAR(100) NOT NULL
);
