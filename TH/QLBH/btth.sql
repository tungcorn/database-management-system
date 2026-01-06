--a

update SP_DonHang
set ThanhTien = sp.SoLuong * s.DonGia
from SP_DonHang sp
join SanPham s on sp.IDSanPham = s.IDSanPham

--b

update DonHang
set TongTien = tongtiensp.tongtien
from DonHang dh
join (
    select sp.IDDonHang, sum(ThanhTien) as tongtien
    from SP_DonHang sp
    group by sp.IDDonHang
) as tongtiensp on dh.IDDonHang = tongtiensp.IDDonHang

select * from DonHang

select * from SP_DonHang

--c

select
    HoTen,
    iif (charindex(' ', HoTen) = 0,
        HoTen,
        RIGHT(HoTen, CHARINDEX(' ', REVERSE(HoTen)))
    ) as ten
from KhachHang

--d

declare ttdonhang cursor dynamic scroll
for
    select dh.IDDonHang, dh.NgayDatHang, dh.TongTien
    from DonHang dh
    join KhachHang kh on dh.IDKhachHang = kh.IDKhachHang
    where kh.HoTen = N'Nguyễn Văn An'
open ttdonhang

declare @iddh int, @ngaydh datetime, @tongtien float
fetch first from ttdonhang into @iddh, @ngaydh, @tongtien
while (@@fetch_status = 0)
Begin
    print cast(@iddh as varchar(10)) + '    ' + CONVERT(varchar(15), @ngaydh, 103) + '    ' + FORMAT(@tongtien, 'N2')
    fetch next from ttdonhang into @iddh, @ngaydh, @tongtien
end

close ttdonhang
deallocate ttdonhang

--e

declare tongsotien cursor dynamic scroll
for
    select sum(TongTien)
    from DonHang dh
    join KhachHang kh on dh.IDKhachHang = kh.IDKhachHang
    where kh.HoTen = N'Nguyễn Văn An'
open tongsotien

declare @tongsotien float
fetch first from tongsotien into @tongsotien
print 'Tong so tien la: ' + format(@tongsotien, 'N2')

close tongsotien
deallocate tongsotien


--f

create procedure doanh_thu_moi_ngay
as
begin
    select NgayDatHang, sum(TongTien)
    from DonHang dh
    group by NgayDatHang
end

exec doanh_thu_moi_ngay

drop procedure doanh_thu_moi_ngay
--g

create procedure doanh_thu_1_ngay
    @ngay varchar(2)
as
begin
    select NgayDatHang, sum(TongTien)
    from DonHang dh
    group by NgayDatHang
    having day(NgayDatHang) = @ngay
end

exec doanh_thu_1_ngay '12'

--h

create procedure tong_tien_cua_1_khach_hang
    @id int
as
begin
    select IDKhachHang, sum(TongTien) as TongTien
    from DonHang dh
    group by IDKhachHang
    having IDKhachHang = @id
end

exec tong_tien_cua_1_khach_hang 1


select *
from DonHang;

--i

create procedure tong_tien_don_hang
    @ma_don_hang int,
    @kq_tong_tien float output
as
begin
    select @kq_tong_tien = TongTien
    from DonHang
    where IDDonHang = @ma_don_hang
end

declare @tong_tien_dh float

exec tong_tien_don_hang
    1,
    @tong_tien_dh output ;

print format(@tong_tien_dh, 'N2')

    DROP PROCEDURE IF EXISTS tong_tien_don_hang;


--dung con tro in ra doanh thu moi ngay cua cua hang, in ra nhung ngay co doanh thu cao nhat

