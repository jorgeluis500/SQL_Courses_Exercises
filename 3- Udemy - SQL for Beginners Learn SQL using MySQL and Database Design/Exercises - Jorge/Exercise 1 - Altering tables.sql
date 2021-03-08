-- EXERCISE 1

-- A) ADD A PRIMARY KEY TO THE ID FIELDS IN THE PETS AND PEOPLE TABLES

-- Pets
DESCRIBE pets;

ALTER TABLE pets
ADD PRIMARY KEY (id);

-- People
DESCRIBE people;
/* This primary key was already created
ALTER TABLE people
ADD PRIMARY KEY (id);
*/

-- B) ADD A FOREIGN KEY TO THE owner_id FIELD IN THE pets TABLE REFERENCING THE id FIELD IN THE people TABLE

ALTER TABLE pets
ADD CONSTRAINT FK_Owner_Pet
FOREIGN KEY (owner_id) REFERENCES people(id);

DESCRIBE pets;

-- C1) ADD A COLUMN NAMED EMAIL TO THE PEOPLE TABLE WITH UNIQUE CONSTRAINT

ALTER TABLE people
ADD COLUMN email VARCHAR(30) UNIQUE;

-- I will now remove the UNIQUE constraint created in the previous statement
DESCRIBE people;
SHOW INDEX FROM people;

ALTER TABLE people
DROP INDEX email; 

/*C1) ADD A COLUMN NAMED EMAIL TO THE PEOPLE TABLE 
ALTER TABLE people
ADD COLUMN email VARCHAR(30)
*/
-- ADD UNIQUE CONSTRAINT WITH A NAME
ALTER TABLE people
ADD CONSTRAINT u_email UNIQUE (email);

-- D) RENAME THE name COLUMN IN THE PETS TABLE TO first_name

DESCRIBE pets;

ALTER TABLE pets CHANGE `name` `first_name` VARCHAR(20);

-- E CHANGE THE postcode DATA TYPE TO CHAR(7) IN THE addresses TABLE

DESCRIBE addresses;
ALTER TABLE addresses MODIFY postcode CHAR(7);