/* Populate database with sample data. */

-- Inserting Agumon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

-- Inserting Gabumon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);

-- Inserting Pikachu
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

-- Inserting Devimon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 11);


/* Insert more data */


-- Inserting Charmander
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11);

-- Inserting Plantmon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

-- Inserting Squirtle
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

-- Inserting Angemon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

-- Inserting Boarmon
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

-- Inserting Blossom
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

-- Inserting Ditto
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);



-- Inserting data into the owners table
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       ('Bob', 45),
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

-- Inserting data into the species table
INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');

-- Update animals with species_id based on name ending
UPDATE animals
SET species_id = (
  CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END
);

-- Update animals with owner_id based on owner's name
UPDATE animals
SET owner_id = (
  CASE
    WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
    WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
    WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
    WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
    WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
  END
);

