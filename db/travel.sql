DROP TABLE cities;
DROP TABLE countries;
DROP TABLE visits;

CREATE TABLE cities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT4 REFERENCES countries(id),
);

CREATE TABLE countries(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) no null
  --continent VARCHAR(255)
);

CREATE TABLE visits(
  id SERIAL8 PRIMARY KEY,
  city_id INT8 REFERENCES cities(id),
  country_id INT8 REFERENCES countries(id)
);

--countries visited
--cities visited
