--LOCK
begin tran
select Tensv from SINHVIEN
                      with (holdlock) where Masv = 'SV002'
update SINHVIEN set diemtk = 10
where Masv = 'SV002'
commit tran


-- XLOCK
    --t2 chuyen 30 dong tu tk2 sang tk1
begin tran
set transaction isolation level read committed
update NganHang set SoDu = SoDu - 30
where IDTaiKhoan = 2
waitfor delay '00:00:10'
update NganHang set SoDu = SoDu + 30
where IDTaiKhoan = 1

commit tran