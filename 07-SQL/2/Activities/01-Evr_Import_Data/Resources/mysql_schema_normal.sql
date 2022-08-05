DROP TABLE IF EXISTS `actor`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `city`;
DROP TABLE IF EXISTS `country`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `customer_list`;
DROP TABLE IF EXISTS `film`;
DROP TABLE IF EXISTS `film_actor`;
DROP TABLE IF EXISTS `inventory`;
DROP TABLE IF EXISTS `payment`;
DROP TABLE IF EXISTS `rental`;
DROP TABLE IF EXISTS `staff`;
DROP TABLE IF EXISTS `store`;


CREATE TABLE `actor` (
  `actor_id` integer NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `last_update` timestamp DEFAULT now()
);

CREATE TABLE address (
  address_id integer NOT NULL,
  address VARCHAR(50) NOT NULL,
  address2 VARCHAR(50),
  district VARCHAR(20) NOT NULL,
  city_id smallint NOT NULL,
  postal_code VARCHAR(10),
  phone VARCHAR(20) NOT NULL,
  last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE city (
  city_id integer NOT NULL,
  city VARCHAR(50) NOT NULL,
  country_id smallint NOT NULL,
  last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE country (
    country_id integer NOT NULL,
    country VARCHAR(50) NOT NULL,
    last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE customer (
  customer_id integer NOT NULL,
  store_id smallint NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50),
  address_id smallint NOT NULL,
  activebool boolean DEFAULT true NOT NULL,
  create_date date DEFAULT now() NOT NULL,
  last_update timestamp DEFAULT now(),
  active integer
);

CREATE TABLE customer_list (
  id integer NOT NULL,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(50) NOT NULL,
  zip_code VARCHAR(10),
  phone VARCHAR(20) NOT NULL,
  city VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  notes VARCHAR(50) NOT NULL,
  sid integer NOT NULL
);

CREATE TABLE film (
  film_id integer NOT NULL,
  title VARCHAR(255) NOT NULL,
  description text,
  release_year integer,
  language_id smallint NOT NULL,
  original_language_id smallint,
  rental_duration smallint DEFAULT 3 NOT NULL,
  rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
  length smallint,
  replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
  rating TEXT,
  last_update timestamp DEFAULT now() NOT NULL,
  special_features TEXT,
  `fulltext` TEXT NOT NULL
);

CREATE TABLE film_actor (
  actor_id smallint NOT NULL,
  film_id smallint NOT NULL,
  last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE inventory (
  inventory_id integer NOT NULL,
  film_id smallint NOT NULL,
  store_id smallint NOT NULL,
  last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE payment (
  payment_id integer NOT NULL,
  customer_id smallint NOT NULL,
  staff_id smallint NOT NULL,
  rental_id integer NOT NULL,
  amount numeric(5,2) NOT NULL,
  payment_date timestamp NOT NULL
);

CREATE TABLE rental (
  rental_id integer NOT NULL,
  rental_date timestamp NOT NULL,
  inventory_id integer NOT NULL,
  customer_id smallint NOT NULL,
  return_date timestamp NULL DEFAULT NULL,
  staff_id smallint NOT NULL,
  last_update timestamp DEFAULT now() NOT NULL
);

CREATE TABLE staff (
  staff_id integer NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  address_id smallint NOT NULL,
  email VARCHAR(50),
  store_id smallint NOT NULL,
  active boolean DEFAULT true NOT NULL,
  username VARCHAR(16) NOT NULL,
  password VARCHAR(40),
  last_update timestamp DEFAULT now() NOT NULL,
  picture blob
);

CREATE TABLE store (
    store_id integer NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp DEFAULT now() NOT NULL
);
