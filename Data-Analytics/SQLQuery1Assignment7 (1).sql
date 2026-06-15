select @@SERVERNAME;
create database studentsperformance;
use studentsperformance;
CREATE TABLE FemaleScores (
    gender VARCHAR(10),
    race_ethnicity VARCHAR(50),
    test_preparation_course VARCHAR(50),
    math_score INT,
    reading_score INT,
    writing_score INT
);
