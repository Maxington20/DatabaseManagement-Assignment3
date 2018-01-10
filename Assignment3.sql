--Assignment 3
--Max Herrington

--1
PRINT'***QUESTION 1***'
PRINT''

SELECT c.name, c.number
FROM Course c, CoursePrerequisiteAnd cp
WHERE c.number = cp.prerequisiteNumber 
	AND cp.courseNumber = 'COMP2280' 
ORDER BY prerequisiteNumber


--2
PRINT'***QUESTION 2***'
PRINT''

SELECT e.number, p.firstName, p.lastName, e.schoolCode, e.extension
FROM Employee e, Person p
WHERE e.number = p.number 
	AND p.lastName LIKE('W%')
ORDER BY e.number


--3
PRINT'***QUESTION 3***'
PRINT''

SELECT Person.number, Person.firstName, Person.lastName, person.city
FROM dbo.Person AS Person 
	LEFT OUTER JOIN dbo.Student AS Student
	ON (person.number = student.number)
WHERE Student.number IS NULL
ORDER BY Person.lastName


--4
PRINT'***QUESTION 4***'
PRINT''

SELECT ls.softwareUniqueId, s.product
FROM  LabSoftware ls, Software s, Room r
WHERE ls.softwareUniqueId = s.uniqueId 
	AND r.id = ls.roomId
	AND r.number = '2A205'
ORDER BY s.product


--5
PRINT'***QUESTION 5***'
PRINT''

SELECT co.sessionCode, co.courseNumber, p.firstName, p.lastName, e.extension
FROM CourseOffering co, Person p, Employee e
WHERE e.number = p.number 
	AND co.employeeNumber = e.number
	AND co.sessionCode = 'F10'
ORDER BY courseNumber


--6
PRINT'***QUESTION 6***'
PRINT''

SELECT p.lastName, p.firstName, p.collegeEmail, so.notes
FROM Student s, StudentOffence so, Person p
WHERE s.number = p.number 
	AND so.studentNumber = s.number
	AND so.penaltyCode Like('%')
ORDER BY studentNumber


--7
PRINT'***QUESTION 7***'
PRINT''

SELECT e1.number AS Employee, e1.reportsTo AS 'Employee Reports To', e2.reportsTo AS 'Supervisor Reports To'
FROM dbo.Employee AS e1 
	LEFT OUTER JOIN dbo.employee AS e2
	ON(e1.reportsTo = e2.number)
ORDER BY e1.number


--8
PRINT'***QUESTION 8***'
PRINT''

SELECT LOWER(LEFT(p.firstName,1)) + LOWER(LEFT(p.lastName,7)) AS 'User Id',
	e.schoolCode, e.extension
FROM Employee e, Person p
WHERE e.number = p.number
	AND LEFT(p.lastName,1)='K'
ORDER BY 'User ID'

select lower(substring(p.firstname,1,1)) + lower(substring(p.lastname,1,7)) AS 'USER ID'
FROM Person P, EMPLOYEE E
WHERE E.number = P.number
	AND SUBSTRING(P.LASTNAME,1,1) = 'K'


--9
PRINT'***QUESTION 9***'
PRINT''

SELECT Course.number AS number, course.hours, course.credits, course.name
FROM dbo.Course LEFT OUTER JOIN dbo.CourseOffering
	ON(course.number = CourseOffering.courseNumber)
WHERE CHARINDEX('Programming',course.name)>0 
	AND CourseOffering.courseNumber IS NULL
