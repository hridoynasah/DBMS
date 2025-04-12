USE UniversityJoins;

SELECT s.LastName, s.Major, e.Grade
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentID = e.StudentID; 