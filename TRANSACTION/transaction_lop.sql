--     ACID
--         ATOMICITY (Nguyên tố)
--         CONSISTENCY (Nhất quán)
--         ISOLATION (CO LAP)

--viet 1 thu tuc de chuyen tien

-- TAIKHOAN (idtk, sodu)

create proc chuyentien @tk1 varchar(5),
                       @tk2 varchar(5),
                       @sotien money output
as
    begin tran
    if not exists(select 1
                  from TAIKHOAN
                  where idtk = @tk1
                     or idtk = @tk2)
        or not exists (select 1
                       from TAIKHOAN
                       where idtk = @tk1
                         and sodu < @sotien)
        begin
            rollback tran
        end
update TAIKHOAN
set sodu = sodu - @sotien
where idtk = @tk1
update TAIKHOAN
set sodu = sodu + @sotien
where idtk = @tk2
    commit tran
end

-- viet 1 thu tuc de dong goi trong giao dich de khi them sv vao 1 lop thi dam bao so luong sv 1 lop <= 12

create proc themsv_lop @masv varchar(10),
                       @tensv nvarchar(100),
                       @malop varchar(50)
as
    begin tran
    if (select count(*)
        from SINHVIEN
        where Malop = @malop) >= 12
        begin
            print 'Khong the them sinh vien vi so luong sinh vien lop se qua 12'
            rollback tran
        end
    commit tran

insert into SINHVIEN (Masv, Tensv, Malop) values ('SV3636', N'NINH BEO', 'TH1')
insert into SINHVIEN (Masv, Tensv, Malop) values ('SV3637', N'NINH BEO', 'TH1')
insert into SINHVIEN (Masv, Tensv, Malop) values ('SV3639', N'NINH BEO', 'TH1')

select count(*)
from SINHVIEN
where Malop = 'TH1'



