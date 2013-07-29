use CloudEDU

--��ѯһ������ȫ��ѧ��
create procedure COURSE.GetStudentsForCourseID @ID int
as
select * from CUSTOMER.CUSTOMER
where customer.customer.id in (select customer_id from customer.attend where customer.attend.course_id = @ID)
go

exec course.GetStudentsForCourseID 000

--��ѯһ���û��μӵ����пγ�

create procedure CUSTOMER.GetAllCoursesAttendedForCustomerID @ID int
as
select * from course.course
where course.id in (select course_id from customer.attend where customer.attend.customer_id = @ID)
go

--��ѯһ���û����ڵ����пγ�

create procedure CUSTOMER.GetAllCoursesTaughtForCustomerID @ID int
as
select * from course.course
where course.id in (select course_id from customer.teach where customer.teach.customer_id = @ID)
go

--����һ�ſγ�


create procedure COURSE.CreateCourse
	@teacher int,
	@title nvarchar(50),
	@intro text = 'NOT SET YET',
	@category int,
	@price money = 0.00,
	@pg int = null,
	@icon_url nvarchar(100)
as
	set nocount on;
	begin try
	begin tran
	insert into course.COURSE(price, title, intro, teacher, CATEGORY, PG, ICON_URL, START_TIME)
		values(@price, @title, @intro, @teacher, @category, @pg, @icon_url, GETDATE());
	commit tran
	end try
	begin catch
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() as ErrorState,
        ERROR_PROCEDURE() as ErrorProcedure,
        ERROR_LINE() as ErrorLine,
        ERROR_MESSAGE() as ErrorMessage;

		rollback tran
	end catch
go

--�μ�һ�ſγ̣�����û�м��pg
 
create procedure COURSE.EnrollCourse
	@course_id int,
	@customer_id int
as
	declare @pr money;
	declare @th int;
	set nocount on;
	begin try
		begin tran
			select @pr = price, @th = TEACHER from COURSE.COURSE where ID = @course_id;
			update CUSTOMER.CUSTOMER set BALANCE = BALANCE - @pr where CUSTOMER.customer.id = @customer_id;
			update customer.CUSTOMER set BALANCE = BALANCE + @pr where CUSTOMER.customer.ID = @th;
			insert into CUSTOMER.ATTEND(COURSE_ID, CUSTOMER_ID,START_TIME) values(@course_id, @customer_id, GETDATE());
		commit tran
	end try
	begin catch
	SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() as ErrorState,
        ERROR_PROCEDURE() as ErrorProcedure,
        ERROR_LINE() as ErrorLine,
        ERROR_MESSAGE() as ErrorMessage;

		rollback tran
	end catch
go


exec course.CreateCourse @teacher=1, @title='hello', @category=1
delete from course.COURSE

update course.COURSE set price = 5.00 where id = 5
update CUSTOMER.CUSTOMER set balance = 10 where id = 4

exec COURSE.EnrollCourse @course_id=5, @customer_id=4

--����˿γ�
create view manager.COURSE_PENDING
as
	select * from Course.COURSE where course.course_status = 'Pending'
go
alter schema course transfer manager.Course_Pending

--ͨ���γ�
create view Course.COURSE_OK
as
	select * from course.COURSE where course.course_status = 'OK'
go

--δͨ����˿γ�
create view manager.COURSE_CANCEL
as
	select * from course.COURSE where course.course_status = 'cancel'
go

alter schema course transfer manager.Course_CANCEL

select * from COURSE.COURSE_ok

--�û�����
create function customer.GetCustomerAgeForID(
	@customer_id int
	)
	returns int
begin
	declare @age int;
	select @age = datediff(year, [birthday], getdate()) from CUSTOMER.CUSTOMER where id = @customer_id;
	return @age;
end
go

--��ֹɾ���û�
create trigger Customer.TR_PREVENTCUSTOMERFROMDELETING
on customer.customer
instead of delete
as
begin
	set nocount on;
	rollback transaction;
end

delete from CUSTOMER.CUSTOMER where id = 3

--�γ���ϸ��ͼ
create view COURSE.COURSE_AVAIL
as
	select CO.ID, CO.PRICE, CO.RATE, CO.TITLE, CO.INTRO, CU.NAME, 
		CA.CATE_NAME, PG.RESTRICT_AGE, PG.DESCRIPTION AS PG_DESCRIPTION,
		CO.ICON_URL
from 
	course.COURSE_OK CO 
	left join CUSTOMER.CUSTOMER CU on CO.TEACHER = CU.ID 
	left join COURSE.CATEGORY CA on co.CATEGORY = ca.ID 
	left join COURSE.PARENT_GUIDE PG on co.PG = pg.ID

--���տγ�����������
create procedure COURSE.COURSE_HOTRANK
as
select CO.ID COURSE_ID, COUNT(*) STUDENTS from COURSE.COURSE_OK CO inner join CUSTOMER.ATTEND AT on co.ID = at.COURSE_ID
group by CO.ID
order by STUDENTS desc
go