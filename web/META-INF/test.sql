Create Table UserPass (
    Username varchar(15) Not Null Primary Key,
    Password varchar(15) Not Null
);

Insert into UserPass values ('Barbara','upmann13'),('Fjubuu','martin80');

Create Table UserRole (
    Username varchar(15) Not Null,
    Rolename varchar(15) Not Null,

    Primary Key (Username,Rolename)
);

insert into UserRole values ('Barbara','manager'),('Fjubuu','programmer');