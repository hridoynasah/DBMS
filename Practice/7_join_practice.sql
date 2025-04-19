# LEFT JOIN

SELECT s.Name, s.cgpa, c.CourseName, i.InstructorName
FROM Students s
LEFT JOIN Courses c ON s.StudentID = c.StudentID
LEFT JOIN Instructors i ON c.StudentID = i.StudentID;


SELECT s.Name, s.cgpa, c.CourseName, i.InstructorName
FROM Students s
LEFT JOIN Courses c ON
s.StudentID = c.StudentID
LEFT JOIN Instructors i ON
s.StudentID = i.StudentID;

# Above both are incorrect & below is the corrected answer 

# Left Join for multiple table
SELECT s.Name, s.cgpa, c.CourseName, i.InstructorName
FROM Students s
LEFT JOIN Courses c ON s.StudentID = c.StudentID
LEFT JOIN Instructors i ON c.InstructorID = i.InstructorID;

# Left Join for two table 

SELECT s.Name, s.cgpa, c.CourseName
FROM Students s
LEFT JOIN Courses c ON s.StudentID = c.StudentID;

# Left Join with WHERE Clause
SELECT s.Name, s.cgpa, c.CourseName, i.InstructorName
FROM Students s
LEFT JOIN Courses c ON s.StudentID = c.StudentID
LEFT JOIN Instructors i ON c.Instructor_Email = i.Instructor_Email
WHERE s.cgpa > 3.5 AND c.CourseName = 'Database';


# RIGHT JOIN

# Right Join for multiple table
SELECT s.Name, s.cgpa, c.CourseName, i.InstructorName
FROM Students s
RIGHT JOIN Courses c ON s.StudentID = c.StudentID
RIGHT JOIN Instructors i ON c.InstructorID = i.InstructorID;

# Right Join for two table 

SELECT s.Name, s.cgpa, c.CourseName
FROM Students s
RIGHT JOIN Courses c ON s.StudentID = c.StudentID;

# Left Join with WHERE Clause
SELECT s.Name, s.cgpa, c.CourseName, i.InstructorName
FROM Students s
RIGHT JOIN Courses c ON s.StudentID = c.StudentID
RIGHT JOIN Instructors i ON c.InstructorID = i.InstructorID
WHERE s.cgpa > 3.5 AND c.CourseName = 'Database';