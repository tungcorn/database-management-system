-- uncommitted
begin tran
set transaction isolation level read uncommitted
select * from test
commit tran


-- committed

begin tran
set transaction isolation level read committed
select * from test
commit tran

-- repeatable read

begin tran
set transaction isolation level read committed
Update test set name='x' where id=3
commit tran

-- serializable

begin tran
Insert into test values (5, 'd')
Select * from test
commit tran