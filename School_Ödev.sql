create database School
go 
use School
go 

--Teacher Tablosu
create table Teacher(
Tec_ID int constraint PK_TecID primary key not null,
Teacher_Name varchar(45),
UserNanem varchar(45),
Email varchar(60),
Passwords int,
Dep_ID int,
Images int,
UserMode varchar(10),
ManagerMode varchar(30),
)
--Department Tablosu
create table Department(
Dep_ID int constraint PK_DepID primary key,
DepartmentName varchar(30)
)

--Course Tablosu
create table Course(
Cou_ID int constraint PK_CouID primary key,
CourseName varchar(45),
CourseCode varchar(10),
Semester smallint,
Tec_ID int constraint FK_TecID foreign key references Teacher(Tec_ID),
Dep_ID int constraint FK_DepID foreign key references Department(Dep_ID), 
Active int,
TeacherName varchar(45),
Edu_Type int,
Link_cou_ID int,
Descriptions int,
Cloose int
)
--Course Content Tablosu

create table Course_Content(
Cou_Con_ID int constraint PK_CouConID primary key,
Week int,
Descriptions int,
FileName1 varchar(100),
FileName2 varchar(100),
File_Content1 int,
File_Content2 int,
Cou_ID int constraint FK_CouID2 foreign key references Course(Cou_ID)
)
--Student Tablosu
create table Student(
Stu_ID bigint constraint PK_StuID primary key,
Student_Name varchar(30),
Email varchar(60),
Passwords int
)
--Practise Tablosu
create table Practise(
Pra_ID int constraint PK_PraID primary key,
Descriptions varchar(100),
FileNames Varchar(100 ) ,
File_Content int ,
DeadTime datetime,
CuttingValue int,
Cou_Id int
)

--Pra_Stu Tablosu
create table Pra_Stu(
Stu_ID bigint constraint FK_StuID3 foreign key references Student(Stu_ID),
Pra_ID int constraint FK_PraID foreign key references Practise(Pra_ID),
Per_ID int,
FileNames varchar(100),
File_Content int,
Grade int,
ClusterNo int
)

--Period Tablosu
create table PPeriod(
Per_ID int constraint PK_Period primary key,
PeriodName varchar(45),
)

--Assignment Tablosu
create table Assignment(
Assi_ID int constraint PK_AssiID primary key,
Descriptions varchar(100),
FileNames varchar(100) ,
File_Content int,
DeadTime datetime,
CuttingValue int,
Cou_ID int constraint FK_CouID4 foreign key references Course(Cou_ID)
)

--Assi_Stu Tablosu
create table Assi_Stu(
Stu_ID bigint constraint FK_StuID2 foreign key references Student(Stu_ID),
Assi_ID int constraint FK_AssiID2 foreign key references Assignment(Assi_ID),
Per_ID int constraint FK_PerID3 foreign key references PPeriod(Per_ID),
FileNames varchar(100),
File_Content int,
Grade int,
ClusterNo int
)

--ClussterCases_Assi Tablosu
create table ClussterCases_Assi (
ID int constraint PK_ID2 primary key,
Assi_ID int constraint FK_AssiID foreign key references Assignment(Assi_ID),
Per_ID int constraint FK_Per3 foreign key references PPeriod(Per_ID),
Cases text,
Distance int
)

--ClusterCases_ID tablosu
create table ClusterCases_Pra(
ID int constraint PK_ID primary key,
Pra_ID int constraint FK_PraID2 foreign key references Practise(Pra_ID),
Per_ID int constraint FK_PerID2 foreign key references PPeriod(Per_ID),
Distance int,
Cases Text
)

--Stu Course Tablosu
create table Stu_Course(
Stu_ID bigint constraint FK_StuID foreign key references Student(Stu_ID),
Cou_ID int constraint FK_CouID3 foreign key references Course(Cou_ID),
Per_ID int constraint FK_PerID foreign key references PPeriod(Per_ID),
)

--Classroom Tablosu
create table Classroom(
Room_ID int constraint PK_RoomID primary key,
RoomName varchar(45),
Capacity smallint
)

--Timeline Tablosu
create table Course_Timeline(
Countim_ID int constraint PK_CountimID primary key,
DayofLessons int,
StartTime int,
Duration int,
Content varchar(10),
Cou_ID int constraint FK_CouID foreign key references Course(Cou_ID),
Room_ID int constraint FK_RoomID foreign key references Classroom(Room_Id)
)

-- Teacher Tablosu
insert into Teacher (Tec_ID, Teacher_Name, UserNanem, Email, Passwords, Dep_ID, Images, UserMode, ManagerMode)
values
(1, 'John Smith', 'john_smith', 'john.smith@example.com', 123456, 1, 0x, 'User', 'Manager'),
(2, 'Jane Doe', 'jane_doe', 'jane.doe@example.com', 654321, 2, 0x, 'User', 'Supervisor'),
(3, 'David Johnson', 'david_j', 'david.johnson@example.com', 789012, 3, 0x, 'User', 'Manager'),
(4, 'Emily White', 'emily_white', 'emily.white@example.com', 567890, 4, 0x, 'User', 'Supervisor'),
(5, 'Michael Brown', 'michael_brown', 'michael.brown@example.com', 345678, 5, 0x, 'User', 'Manager'), 
(6, 'Sophia Miller', 'sophia_m', 'sophia.miller@example.com', 901234, 6, 0x, 'User', 'Supervisor'),
(7, 'Daniel Wilson', 'daniel_w', 'daniel.wilson@example.com', 432109, 7, 0x, 'User', 'Manager'),
(8, 'Olivia Davis', 'olivia_d', 'olivia.davis@example.com', 210987, 8, 0x, 'User', 'Supervisor'),
(9, 'Ethan Jones', 'ethan_j', 'ethan.jones@example.com', 876543, 9, 0x, 'User', 'Manager'),
(10, 'Ava Robinson', 'ava_r', 'ava.robinson@example.com', 109876, 10, 0x, 'User', 'Supervisor');

--Course_content tablosu
insert into Course_Content (Cou_Con_ID, Week, Descriptions, FileName1, FileName2, File_Content1, File_Content2, Cou_ID)
values
(1, 1, 100, 'Hafta1_Dosya1.txt', 'Hafta1_Dosya2.txt', 200, 300, 1),
(2, 2, 150, 'Hafta2_Dosya1.txt', 'Hafta2_Dosya2.txt', 250, 350, 2),
(3, 3, 120, 'Hafta3_Dosya1.txt', 'Hafta3_Dosya2.txt', 180, 280, 3),
(4, 4, 200, 'Hafta4_Dosya1.txt', 'Hafta4_Dosya2.txt', 220, 320, 4),
(5, 5, 90, 'Hafta5_Dosya1.txt', 'Hafta5_Dosya2.txt', 130, 230, 5),
(6, 6, 180, 'Hafta6_Dosya1.txt', 'Hafta6_Dosya2.txt', 240, 340, 6),
(7, 7, 110, 'Hafta7_Dosya1.txt', 'Hafta7_Dosya2.txt', 160, 260, 7),
(8, 8, 170, 'Hafta8_Dosya1.txt', 'Hafta8_Dosya2.txt', 200, 300, 8),
(9, 9, 130, 'Hafta9_Dosya1.txt', 'Hafta9_Dosya2.txt', 220, 320, 9),
(10, 10, 190, 'Hafta10_Dosya1.txt', 'Hafta10_Dosya2.txt', 260, 360, 10);

-- Assi_Stu Tablosu
insert into Assi_Stu (Stu_ID, Assi_ID, Per_ID, FileNames, File_Content, Grade, ClusterNo)
values
(1, 1, 1, 'Öðrenci1_.txt', 500, 85, 1),
(2, 2, 2, 'Öðrenci2_.txt', 600, 90, 1),
(3, 3, 3, 'Öðrenci3_.txt', 450, 88, 2),
(4, 4, 4, 'Öðrenci4_.txt', 550, 92, 2),
(5, 5, 5, 'Öðrenci5_.txt', 400, 78, 3),
(6, 6, 6, 'Öðrenci6_.txt', 520, 85, 3),
(7, 7, 7, 'Öðrenci7_.txt', 700, 95, 4),
(8, 8, 8, 'Öðrenci8_.txt', 480, 87, 4),
(9, 9, 9, 'Öðrenci9_.txt', 430, 80, 5),
(10,10,10, 'Öðrenci10_.txt', 580, 89, 5);

-- PPeriod Tablosu
insert into PPeriod (Per_ID, PeriodName)
values
(1, 'Bahar Dönemi'),
(2, 'Yaz Dönemi'),
(3, 'Güz Dönemi'),
(4, 'Kýþ Dönemi'),
(5, 'Yaz Okulu'),
(6, 'Kýþ Okulu'),
(7, 'Ýlkbahar Dönemi'),
(8, 'Sonbahar Dönemi'),
(9, 'Yarýyýl Tatili'),
(10, 'Mezuniyet Dönemi');

-- Student Tablosu
insert into Student (Stu_ID, Student_Name, Email, Passwords)
values
(1, 'Yiðit', 'yigit@example.com', 123456),
(2, 'Beyza', 'beyza@example.com', 789012),
(3, 'Berke', 'berke@example.com', 345678),
(4, 'Ela', 'ela@example.com', 901234),
(5, 'Ýzel', 'izel@example.com', 567890),
(6, 'Ýhsan', 'ihsan@example.com', 234567),
(7, 'Furkan', 'furkan@example.com', 890123),
(8, 'Emre', 'emre@example.com', 456789),
(9, 'Taner', 'taner@example.com', 123890),
(10, 'Tolga', 'tolga@example.com', 789012);

--Assignment tablosu
insert into Assignment(Assi_ID,Cou_ID,CuttingValue,DeadTime,Descriptions,File_Content,FileNames)
values
(1,1,11,2024-10-10,'Açýklama1',21,'AssignmnetDosya1'),
(2,2,12,2024-09-10,'Açýklama2',22,'AssignmentDosya2'),
(3,3,13,2024-01-10,'Açýkalama3',23,'AssignmentDosya3'),
(4,4,14,2024-02-10,'Açýkalama4',24,'AssignmentDosya4'),
(5,5,15,2024-03-10,'Açýklama5',25,'AssignmentDosya5'),
(6,6,16,2024-04-10,'Açýklama6',26,'Assignment6'),
(7,7,17,2024-05-10,'Açýkalama7',27,'Assignment7'),
(8,8,18,2024-06-10,'Açýklama8',28,'Assignment8'),
(9,9,19,2024-07-10,'Açýklama9',29,'Assignment9'),
(10,10,20,2024-09-10,'Açýklama10',20,'Assignment10')

-- Department Tablosu
insert into Department (Dep_ID, DepartmentName)
values
(1, 'Bilgisayar Mühendisliði'),
(2, 'Matematik'),
(3, 'Elektrik Mühendisliði'),
(4, 'Makine Mühendisliði'),
(5, 'Fizik'),
(6, 'Yazýlým Mühendisliði'),
(7, 'Endüstri Mühendisliði'),
(8, 'Moleküler Biyoloji ve Genetik'),
(9, 'Ýnþaat Mühendisliði'),
(10, 'Kimya');

--Course tablosu
insert into Course (Cou_ID, CourseName, CourseCode, Semester, Tec_ID, Dep_ID, Active, TeacherName, Edu_Type, Link_cou_ID, Descriptions, Cloose)
values
(1, 'Bilgisayar Mühendisliði Proje Yönetimi', 'BM101', 1, 1, 1, 1, 'Yiðithan', 1, NULL, 200, 0),
(2, 'Matematik 1', 'MAT101', 1, 2, 2, 1, 'Barkýn', 1, NULL, 180, 1),
(3, 'Elektrik Devre Temelleri', 'ELE101', 2, 3, 3, 1, 'Yakup', 1, NULL, 220, 0),
(4, 'Veri Yapýlarý ve Algoritmalar', 'BYA101', 2, 4, 4, 1, 'Beyza', 1, NULL, 250, 1),
(5, 'Fizik 1', 'FIZ101', 1, 5, 5, 1, 'Enes', 1, NULL, 190, 0),
(6, 'Veritabaný Yönetimi', 'VTY101', 2, 6, 6, 1, 'Ela', 1, NULL, 210, 1),
(7, 'Mikroiþlemciler ve Mikrobilgisayarlar', 'MIK101', 3, 7, 7, 1, 'Emre', 1, NULL, 240, 0),
(8, 'Ýnternet Programlama', 'WEB101', 3, 8, 8, 1, 'Derya', 1, NULL, 200, 1),
(9, 'Lineer Cebir', 'LIN101', 1, 9, 9, 1, 'Cem', 1, NULL, 180, 0),
(10, 'Mobil Uygulama Geliþtirme', 'MOB101', 2, 10, 10, 1, 'Furkan', 1, NULL, 230, 1);

-- Teacher Tablosu
insert into Teacher (Tec_ID, Teacher_Name, UserNanem, Email, Passwords, Dep_ID, Images, UserMode, ManagerMode)
values
(1, 'Aslýhan ', 'aslihan', 'aslihan@example.com', 654321, 1, 1, 'Teacher', 'Bölüm yöneticisi'),
(2, 'Burak ', 'burak', 'burak@example.com', 987654, 2, 2, 'Teacher', 'Kurs Yöneticisi'),
(3, 'Canan ', 'canan', 'cananak@example.com', 123987, 1, 3, 'Teacher', 'Akademik Yardýmcý'),
(4, 'Dilara ', 'dilara', 'dilara@example.com', 456789, 2, 4, 'Teacher', 'Kurs Görevlisi'),
(5, 'Erdem ', 'erdem', 'erdem@example.com', 789012, 3, 5, 'Teacher', 'Araþtýrma Görevlisi'),
(6, 'Fatma ', 'fatma', 'fatma@example.com', 234567, 1, 6, 'Teacher', 'Bölüm Yöneticisi'),
(7, 'Gökhan ', 'gokhan', 'gokhan@example.com', 890123, 2, 7, 'Teacher', 'Kurs Organizatörü'),
(8, 'Hatice ', 'hatice', 'hatice@example.com', 345678, 3, 8, 'Teacher', 'Akademik Yardýmcý'),
(9, 'Ýsmail ', 'ismail', 'ismail@example.com', 567890, 1, 9, 'Teacher', 'Kurs Görevlisi'),
(10, 'Jale ', 'jale', 'jale@example.com', 901234, 2, 10, 'Teacher', 'Araþtýrma Görevlisi');


-- Practise Tablosu
insert into Practise (Pra_ID, Descriptions, FileNames, File_Content, DeadTime, CuttingValue, Cou_Id)
values
(1, 'Ödev 1 Açýklama', 'Odev1', 100, '2023-12-31 ', 50, 1),
(2, 'Ödev 2 Açýklama', 'Odev2', 120, '2023-12-31 ', 60, 2),
(3, 'Proje Açýklama', 'Proje', 150, '2023-12-31 ', 70, 3),
(4, 'Pratik Çalýþma 1 Açýklama', 'Pratik1', 80, '2023-12-31 ', 40, 4),
(5, 'Quiz Açýklama', 'Quiz', 90, '2023-12-31 ', 30, 5),
(6, 'Ödev 3 Açýklama', 'Odev3', 110, '2023-12-31 ', 55, 6),
(7, 'Sunum Açýklama', 'Sunum', 130, '2023-12-31 ', 75, 7),
(8, 'Proje 2 Açýklama', 'Proje2', 160, '2023-12-31 ', 80, 8),
(9, 'Pratik Çalýþma 2 Açýklama', 'Pratik2', 70, '2023-12-31 ', 35, 9),
(10, 'Final Sýnavý Açýklama', 'Final', 200, '2023-12-31 ', 100, 10);

-- Classroom Tablosu
insert into Classroom (Room_ID, RoomName, Capacity)
values
(1, '101', 30),
(2, '102', 25),
(3, '103', 35),
(4, '104', 40),
(5, '105', 20),
(6, '106', 30),
(7, '107', 25),
(8, '108', 35),
(9, '109', 40),
(10, '110', 20);

-- Course_Timeline Tablosu
insert into Course_Timeline (Countim_ID, DayofLessons, StartTime, Duration, Content, Cou_ID, Room_ID)
values
(1, 1, 9, 2, 'Ders 1', 1, 1),
(2, 2, 11, 1, 'Ders 2', 2, 2),
(3, 3, 13, 3, 'Ders 3', 3, 3),
(4, 4, 10, 2, 'Ders 4', 4, 4),
(5, 5, 14, 1, 'Ders 5', 5, 5),
(6, 1, 9, 2, 'Ders 6', 6, 6),
(7, 2, 11, 1, 'Ders 7', 7, 7),
(8, 3, 13, 3, 'Ders 8', 8, 8),
(9, 4, 10, 2, 'Ders 9', 9, 9),
(10, 5, 14, 1, 'Ders 10', 10, 10);

-- Stu_Course Tablosu
insert into Stu_Course (Stu_ID, Cou_ID, Per_ID)
values
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- Pra_Stu Tablosu
insert into Pra_Stu (Stu_ID, Pra_ID, Per_ID, FileNames, File_Content, Grade, ClusterNo)
values
(1, 1, 1, 'Dosya1', 100, 85, 1),
(2, 2, 2, 'Dosya2', 90, 90, 1),
(3, 3, 3, 'Dosya3', 88, 88, 2),
(4, 4, 4, 'Dosya4', 92, 92, 2),
(5, 5, 5, 'Dosya5', 78, 78, 3),
(6, 6, 6, 'Dosya6', 85, 85, 3),
(7, 7, 7, 'Dosya7', 95, 95, 4),
(8, 8, 8, 'Dosya8', 87, 87, 4),
(9, 9, 9, 'Dosya9', 80, 80, 5),
(10, 10, 10, 'Dosya10', 89, 89, 5);

-- ClusterCases_Pra Tablosu
insert into ClusterCases_Pra (ID, Pra_ID, Per_ID, Distance, Cases)
values
(1, 1, 1, 10, 'Analiz'),
(2, 2, 2, 15, 'Sentez'),
(3, 3, 3, 20, 'Çözümleme'),
(4, 4, 4, 25, 'Planlama'),
(5, 5, 5, 30, 'Tasarým'),
(6, 6, 6, 35, 'Geliþtirme'),
(7, 7, 7, 40, 'Test'),
(8, 8, 8, 45, 'Optimizasyon'),
(9, 9, 9, 50, 'Entegrasyon'),
(10, 10, 10, 55, 'Yönetim');

-- ClussterCases_Assi Tablosu
insert into ClussterCases_Assi (ID, Assi_ID, Per_ID, Cases, Distance)
values
(1, 1, 1, 'Ödev Aþamasý', 10),
(2, 2, 2, 'Proje Geliþtirme', 15),
(3, 3, 3, 'Analiz Süreci', 20),
(4, 4, 4, 'Test Etme', 25),
(5, 5, 5, 'Tasarým Adýmlarý', 30),
(6, 6, 6, 'Entegrasyon Ýþlemleri', 35),
(7, 7, 7, 'Çözümleme Aþamasý', 40),
(8, 8, 8, 'Optimizasyon Çalýþmalarý', 45),
(9, 9, 9, 'Planlama Süreci', 50),
(10, 10, 10, 'Geliþtirme Adýmlarý', 55);
