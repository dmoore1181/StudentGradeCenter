-- Create Table: Student
--------------------------------------------------------------------------------
CREATE TABLE dbo.Student
(
	StudentId INT NOT NULL IDENTITY(1, 1)
	,FirstName VARCHAR(250) NOT NULL 
	,LastName VARCHAR(250) NOT NULL 
	,Email VARCHAR(250) NOT NULL 
	,UserName VARCHAR(250) NOT NULL 
	,Password VARCHAR(250) NOT NULL 
)
ON [PRIMARY]
GO
ALTER TABLE dbo.Student ADD CONSTRAINT
PK_Student PRIMARY KEY CLUSTERED (StudentId)
ON [PRIMARY]



-- Create Table: Course
--------------------------------------------------------------------------------
CREATE TABLE dbo.Course
(
	CourseId INT NOT NULL IDENTITY(1, 1)
	,StudentId INT NOT NULL 
	,CourseName VARCHAR(250) NOT NULL 
	,Year INT NOT NULL 
	,SemesterID INT NOT NULL 
)
GO
ALTER TABLE dbo.Course ADD CONSTRAINT
PK_Course PRIMARY KEY CLUSTERED (CourseId)



-- Create Table: Grade
--------------------------------------------------------------------------------
CREATE TABLE dbo.Grade
(
	GradeId INT NOT NULL IDENTITY(1, 1)
	,GradeTypeId INT NOT NULL 
	,Grade INT NOT NULL 
)
GO
ALTER TABLE dbo.Grade ADD CONSTRAINT
PK_Grade PRIMARY KEY CLUSTERED (GradeId)



-- Create Table: GradeBreakdown
--------------------------------------------------------------------------------
CREATE TABLE dbo.GradeBreakdown
(
	GradeBreakDownId INT NOT NULL IDENTITY(1, 1)
	,Letter VARCHAR(10) NOT NULL 
	,Min INT NOT NULL 
	,Max INT  NULL 
	,CourseId INT NOT NULL 
)
GO
ALTER TABLE dbo.GradeBreakdown ADD CONSTRAINT
PK_GradeBreakdown PRIMARY KEY CLUSTERED (GradeBreakDownId)



-- Create Table: GradeType
--------------------------------------------------------------------------------
CREATE TABLE dbo.GradeType
(
	GradeTypeId INT  NULL 
	,GradeTypeName VARCHAR(250)  NULL 
	,CourseId INT NOT NULL 
	,Weight INT NOT NULL 
)



-- Create Table: Semester
--------------------------------------------------------------------------------
CREATE TABLE dbo.Semester
(
	SemesterID INT NOT NULL IDENTITY(1, 1)
	,SemesterName VARCHAR(250) NOT NULL 
)
GO
ALTER TABLE dbo.Semester ADD CONSTRAINT
PK_Semester PRIMARY KEY CLUSTERED (SemesterID)



-- Create Foreign Key: GradeType.CourseId -> Course.CourseId
ALTER TABLE [GradeType] ADD CONSTRAINT
[FK_GradeType_CourseId_Course]
FOREIGN KEY ([CourseId])
REFERENCES [Course] ([CourseId])
ON UPDATE NO ACTION
ON DELETE NO ACTION



-- Create Foreign Key: GradeBreakdown.CourseId -> Course.CourseId
ALTER TABLE [GradeBreakdown] ADD CONSTRAINT
[FK_GradeBreakdown_CourseId_Course]
FOREIGN KEY ([CourseId])
REFERENCES [Course] ([CourseId])
ON UPDATE NO ACTION
ON DELETE NO ACTION



-- Create Foreign Key: Course.StudentId -> Student.StudentID
ALTER TABLE [Course] ADD CONSTRAINT
[FK_Course_StudentId_Student]
FOREIGN KEY ([StudentId])
REFERENCES [Student] ([StudentID])
ON UPDATE NO ACTION
ON DELETE NO ACTION



-- Create Foreign Key: Grade.GradeTypeId -> GradeType.GradeTypeId
ALTER TABLE [Grade] ADD CONSTRAINT
[FK_Grade_GradeTypeId_GradeType]
FOREIGN KEY ([GradeTypeId])
REFERENCES [GradeType] ([GradeTypeId])
ON UPDATE NO ACTION
ON DELETE NO ACTION



-- Create Foreign Key: Course.SemesterID -> Semester.SemesterID
ALTER TABLE [Course] ADD CONSTRAINT
[FK_Course_SemesterID_Semester]
FOREIGN KEY ([SemesterID])
REFERENCES [Semester] ([SemesterID])
ON UPDATE NO ACTION
ON DELETE NO ACTION
