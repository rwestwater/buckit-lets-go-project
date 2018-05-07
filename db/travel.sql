DROP TABLE visits;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE cities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT8 REFERENCES countries(id)
);

CREATE TABLE visits(
  id SERIAL8 PRIMARY KEY,
  city_id INT8 REFERENCES cities(id),
  country_id INT8 REFERENCES countries(id)
);
