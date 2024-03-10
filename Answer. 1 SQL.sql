CREATE DATABASE SQL_ASSESSMENT;

USE SQL_ASSESSMENT;

CREATE TABLE runners (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO runners (id, name) VALUES
(1, 'John Doe'),
(2, 'Jane Doe'),
(3, 'Alice Jones'),
(4, 'Bobby Louis'),
(5, 'Lisa Romero');

CREATE TABLE races (
    id INT PRIMARY KEY,
    event VARCHAR(255) NOT NULL,
    winner_id INT,
    FOREIGN KEY (winner_id) REFERENCES runners(id)
);

INSERT INTO races (id, event, winner_id) VALUES
(1, '100 meter dash', 2),
(2, '500 meter dash', 3),
(3, 'cross-country', 2),
(4, 'triathlon', NULL);

SELECT * FROM runners WHERE id NOT IN (SELECT winner_id FROM races);
-- Explanation: The result includes the runners who have not won any races, which means their id is not present in the winner_id column of the races table.



-- ALTERNATE VERSION OF CODE
SELECT r.*
FROM runners r
LEFT JOIN races ra ON r.id = ra.winner_id
WHERE ra.winner_id IS NULL;

