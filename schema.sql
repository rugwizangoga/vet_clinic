/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10,2)
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);


-- Add the "species_id" column
ALTER TABLE animals
ADD COLUMN species_id INTEGER;

-- Add a foreign key constraint for the "species_id" column
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species (id);

-- Add the "owner_id" column
ALTER TABLE animals
ADD COLUMN owner_id INTEGER;

-- Add a foreign key constraint for the "owner_id" column
ALTER TABLE animals
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners (id);

-- Remove the "species" column
ALTER TABLE animals
DROP COLUMN species;


CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets (id),
  species_id INTEGER REFERENCES species (id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Execution time improvement

-- crete index for visits (animal_id)
CREATE INDEX visits_animal_id_idx ON visits (animal_id);

-- crete index for visits (vet_id)
CREATE INDEX visits_vet_id_idx ON visits (vet_id);

-- crete index for owners (email column)
CREATE INDEX owners_email_idx ON owners (email);