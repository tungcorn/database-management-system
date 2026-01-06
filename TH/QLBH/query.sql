use QLBH;
exec sp_helpfile;

SELECT
    dh.IDDonHang,
    kh.HoTen,
    sp.TenSP,
    ct.SoLuong,
    ct.ThanhTien,
    dh.NgayDatHang
FROM DonHang dh
         JOIN KhachHang kh ON dh.IDKhachHang = kh.IDKhachHang
         JOIN SP_DonHang ct ON dh.IDDonHang = ct.IDDonHang
         JOIN SanPham sp ON ct.IDSanPham = sp.IDSanPham;

select * from SP_DonHang

select * from DonHang