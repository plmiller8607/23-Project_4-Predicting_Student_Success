CREATE TABLE student_data (
  	state_student_number NUMERIC,
    gender VARCHAR,
    hispanic_latino VARCHAR,
    ethnicity VARCHAR,
    grade VARCHAR,
    course_id VARCHAR,
    course_title VARCHAR,
    mark VARCHAR,
	department VARCHAR,
	begin_period VARCHAR,
    elementary_school_code VARCHAR,
    calendar_month INTEGER,
    calendar_year INTEGER,
    school_year VARCHAR,
    term_code VARCHAR
);

--Import the student data csv files into SQL and merge all into the student_data table
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_9-1.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_9-2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_10-1.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_10-2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_11-1.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_11-2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_12-1.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
COPY student_data FROM 'D:\1Bootcamp1\23-Project_4\student_data_12-2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

--View the table to make sure data is imported
SELECT * FROM student_data LIMIT 10;

ALTER TABLE Student_Data DROP COLUMN begin_period;
SELECT * FROM student_data LIMIT 3

--RENAME to shorten state_student_number to student_id
ALTER TABLE Student_Data RENAME COLUMN state_student_number TO student_id;
SELECT * FROM student_data LIMIT 3

--Save dataset as csv
COPY Student_Data TO 'D:\1Bootcamp1\23-Project_4\student_data_12-1-24.csv' WITH (FORMAT csv, HEADER true);


--Redaction of student number
--View the lowest and highest student_id to determine how to redact the original number
SELECT MIN(student_id) AS lowest_student_id, MAX(student_id) AS highest_student_id FROM Student_Data;

--Create a temporary column to cast student_id from numeric to string
--Create temporary column
ALTER TABLE student_data ADD COLUMN temp_student_id VARCHAR;

--Check for null values and delete
SELECT COUNT(*) AS null_student_id_count
FROM student_data
WHERE student_id IS NULL;

DELETE FROM student_data
WHERE student_id IS NULL;




--Convert & update temp column
UPDATE student_data 
SET temp_student_id = CAST(student_id AS VARCHAR);

--Save dataset as csv
COPY Student_Data TO 'D:\1Bootcamp1\23-Project_4\student_data_backup.csv' WITH (FORMAT csv, HEADER true);

--Drop 2 digits from each school_id
UPDATE student_data
SET temp_student_id = SUBSTRING(temp_student_id FROM 1 FOR 1) || 
                      SUBSTRING(temp_student_id FROM 3 FOR 4) || 
                      SUBSTRING(temp_student_id FROM 8);

--Update original column
UPDATE Student_Data
SET student_id = CAST(temp_student_id AS NUMERIC);
--Drop temp column
ALTER TABLE Student_Data DROP COLUMN temp_student_id;
SELECT * FROM student_data LIMIT 25

--Save as redacted csv file. 
--To protect student data, this is the only csv file that will be submitted for this project.
COPY Student_Data TO 'D:\1Bootcamp1\23-Project_4\student_data_redact.csv' WITH (FORMAT csv, HEADER true);













