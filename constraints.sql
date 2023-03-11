CREATE TABLE human (
  id BIGSERIAL Not NULL,
  first_name VARCHAR(50) Not NULL,
  last_name VARCHAR(50) Not NULL,
  gender VARCHAR(7) Not NULL,
  date_of_birth date Not NULL,
  email VARCHAR(150)
);