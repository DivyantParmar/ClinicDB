-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <15-3-2023>
-- Description:	<Get Patient Gender  Male>
-- =============================================
CREATE PROCEDURE sp_GetPatientDetails150323
AS
BEGIN
    Select*from PatientMaster where Gender='Male'
END
GO



Exec sp_GetPatientDetails150323



-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <15-3-2023>
-- Description:	<Get Doctor Male>
-- =============================================
CREATE PROCEDURE Sp_getDocterDetails1503
AS
BEGIN
	select*from  tbl_DoctorDetails where Gender='Male'
	SET NOCOUNT ON;   
END
GO

Exec Sp_getDocterDetails1503



-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <16-3-2023>
-- Description:	<PatientMaster Unknown ClinicId=33>
-- =============================================
CREATE PROCEDURE SP_GetPatientmaster
AS
BEGIN
    select*from PatientMaster where FName='unknown'and ClinicID=33

END
GO

Exec SP_GetPatientmaster 




-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <15-3-2023>
-- Description:	<Get Doctor Male>
-- =============================================
ALTER PROCEDURE [dbo].[Sp_getDocterDetails1503]
@Male nvarchar(100),
@ClinicId Int
AS
BEGIN
	select*from  tbl_DoctorDetails where IsActive=1 and Gender=@male and ClinicID=@ClinicId
	SET NOCOUNT ON;   
END

Exec Sp_getDocterDetails1503 @male='Female', @ClinicId=3




-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <16-3-2023>
-- Description:	<PatientMaster Dynamic data>
-- =============================================

ALTER PROCEDURE [dbo].[SP_GetPatientmaster]
(@Cid int,
@Name nvarchar(max),
@Moblie nvarchar(200),
@Fdate nvarchar(25),
@Tdate nvarchar(25)
)
AS
BEGIN
    select*from PatientMaster where IsActive=1
	and
	(@Cid=0 or ClinicID=@Cid)
	and
	(@Name='' or FName like'%'+ @Name+'%')
	and
	(@Moblie='' Or Mobile Like '%'+@Moblie+'%')
	and
	(@Fdate='' or RegistrationDate between @Fdate and @Tdate)
	order by patientid desc

END


exec SP_GetPatientmaster @Cid=15,@Name='',@moblie='',@Fdate='',@Tdate=''


-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <18-3-23>
-- Description:	<Option-1 to get clinic Option-2 to get age>
-- =============================================
CREATE PROCEDURE Get_PatientMode1
(
@ClinicId Int,
@Opt int,
@age int
)
AS
BEGIN
  
  if(@Opt=1)
  begin
	Select*from Patientmaster where IsActive=1 and ClinicID=@ClinicId
  end
  if(@Opt=2)
  begin
    Select*from PatientMaster where IsActive=1 and Age=@age
  end
END
GO

Exec Get_PatientMode1 @age='',@ClinicId='15',@Opt=1


-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <19-3-23>
-- Description:	<Set Enquiry in the table >
-- =============================================
CREATE PROCEDURE  [dbo].[set_AddEnquiry1903]
(@Sourceid int,
@Cid int,
@FName nvarchar(max),
@LastName nvarchar(max),
@Birthdate DateTime,
@Age int
)
AS
BEGIN
     insert into Enquiry (Sourceid,ClinicID,EnquiryDate,FirstName,LastName,DateBirth,Age,IsActive)

	 Values(@Sourceid,@Cid,Getdate(),@FName,@LastName,@Birthdate,@Age,1)
END




-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <19-3-23>
-- Description:	<Set Persnoal in the table >
-- =============================================
CREATE PROCEDURE  SetEmployeePersonal
(
@ClinicID int,
@EmployeeCode nvarchar(max),
@FName nvarchar(max),
@MiddleName  nvarchar(max),
@Surname nvarchar(max),
@Gender nvarchar (max),
@Religion nvarchar (max),
@Birthdate datetime
)
AS
BEGIN
     insert into tblEmployeePersonal(ClinicID,FirstName,MiddleName,Surname,EmployeeCode,Gender,Religion,BirthDate,IsActive)

	 Values(@ClinicID,@FName,@MiddleName,@Surname,@EmployeeCode,@Gender,@Religion,@Birthdate,1)
END





-- =============================================
-- Author:		<Divyant Parmar>
-- Create date: <20-3-2023>
-- Description:	< Full Procedure Weltec Student Database>
-- =============================================
Create PROCEDURE Set_StudentLogin
(
  --Personal Details---

@FirstName nvarchar(max),@LastName nvarchar(max),@DateofBirth date,@Age int,@FatherName nvarchar(max),
@Gender nvarchar(max),@MaritalStatus nvarchar(max),@Citizenship nvarchar(max),@Country nvarchar(max),
@Bloodgroup nvarchar(max),@Caste nvarchar(max),@SubCaste nvarchar(max),@Religions nvarchar(max),
@Createby nvarchar(max),@Createon nvarchar(max),@Updateby nvarchar(max),@Updateon nvarchar(max),@Isactive nvarchar(max),

  --Bank Details--
@BankAccno nvarchar(max),@StudentName nvarchar(max),
@BankName nvarchar(max),@Branch nvarchar(max),@AccountType nvarchar(max),
@Ifsccode nvarchar(max),@Micrno nvarchar(max),


--Contact Details--
@HomeAddress nvarchar(max),@MobileNo nvarchar(max),@LandlineNo nvarchar(max),@Email nvarchar(max),
@SkypeId nvarchar(max),@SlackID nvarchar(max),@LinkinId nvarchar(max),@OfficeAddress nvarchar(max),
@OfficeNo nvarchar(max),@CountryID nvarchar(max),@StateID nvarchar(max),@CityID nvarchar(max),


 --Eduction Details--
@Qualification nvarchar(max),@School nvarchar(max),@CollegeofUnversity nvarchar(max),@PassoutYear nvarchar(max),
@Subjectorfield nvarchar(max),@PercentageorGrade nvarchar(max),


--Experience Details--
@Occupation nvarchar(max),@DateOfJoining nvarchar(max),@Experience nvarchar(max),@Designation nvarchar(max),
@CurrentCompany nvarchar(max),@Sector nvarchar(max),@PreviousCompany nvarchar(max),

---Login Details---
@RoleId nvarchar(max)
)
AS
BEGIN

      Declare @Ischeck int
      Declare @GeneratedId int

      Declare @UserName nvarchar(100);
      Declare @Password nvarchar(100);

      Set @UserName=@Email;
	  Set @Password='Admin@123'

      Set @Ischeck=(Select count(*) From BankDetails where IFSCCode=@Ifsccode 
      and BankAccno=@BankAccno and BankName=@BankName)

      Set @Ischeck=(select Count(*) From ContactDetails where MobileNo=@MobileNo
      and Email=@Email)


	If(@Ischeck=0)
	Begin
	--StudenDetails 
	Insert Into StudentDetalis(FirstName,LastName,DateofBirth,Age,FatherName,
	Gender,MaritalStatus,Citizenship,BloodGroup,Caste,
	SubCaste,Religions,CreateBy,Createon,UpdateBy,UpdateOn,IsActive)

	Values(@FirstName,@LastName,@DateofBirth,@Age,@FatherName,
	@Gender,@MaritalStatus,@Citizenship,@Bloodgroup,@Caste,
	@SubCaste,@Religions,@Createby,@Createon,@Updateby,@Updateon,@Isactive)

	Set @GeneratedId=@@IDENTITY
	--Bank Details Insert Values
	Insert Into BankDetails(StudentId,BankAccNo,StudentName,BankName,Branch,AccountType,IFSCCode,MICRNo)
	Values(@GeneratedId,@BankAccno,@StudentName,@BankName,@Branch,@AccountType,@Ifsccode,@Micrno)

	--Contact Details Insert Values
	Insert Into ContactDetails(StudentId,HomeAddress,MobileNo,LandlineNo,Email,SkypeID,SlackID,LinkedinID,OfficeAddress,CountryID,StateID,CityID)
	Values(@GeneratedId,@HomeAddress,@MobileNo,@LandlineNo,@Email,@SkypeId,@SlackID,@LinkinId,@OfficeAddress,@CountryID,@StateID,@CityID)

	--Education Details Insert Values
	Insert Into EducationDetails(StudentId,Qualification,School,CollegeOrUniversity,PassOutYear,SubjectOrField,PercentageOrGrade)
	Values(@GeneratedId,@Qualification,@School,@CollegeofUnversity,@PassoutYear,@Subjectorfield,@PercentageorGrade)

	--Experince Details Insert Values
	Insert into ExperienceDetails(StudentId,Occupation,DateOfJoining,Experience,Designation,CurrentCompany,
	Sector,PreviousCompany)
	values(@GeneratedId,@Occupation,@DateOfJoining,@Experience,@Designation,@CurrentCompany,
	@Sector,@PreviousCompany)

	--User/Login Insert Values
	insert into Login(UserName,Password,StudentId,RoleId)
	Values(@UserName,@Password,@GeneratedId,@RoleId)
 
	Select @GeneratedId UserId
	
	END
	Else
	  Begin
		Select-1 UserId
	  End

END

Select*from EducationDetails

GO





