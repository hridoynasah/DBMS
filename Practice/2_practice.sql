USE UniversityJoins;

SELECT s.LastName, s.Major, e.Grade
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID; 

SELECT s.FirstName, s.LastName, e.Grade
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
UNION
SELECT s.FirstName, s.LastName, e.Grade
FROM Students s
RIGHT JOIN Enrollments e ON s.StudentID = e.StudentID;