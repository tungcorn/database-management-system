-- 1. Thêm dữ liệu bảng KhachHang (5 bản ghi)
INSERT INTO KhachHang (HoTen, GioiTinh, DiaChi, Email, SoDienThoai)
VALUES
    (N'Nguyễn Văn An', 'Nam', N'Hà Nội', 'an.nguyen@gmail.com', '0901234567'),
    (N'Trần Thị Bích', N'Nữ', N'Hải Phòng', 'bich.tran@yahoo.com', '0912345678'),
    (N'Lê Hoàng Cường', 'Nam', N'Đà Nẵng', 'cuong.le@outlook.com', '0923456789'),
    (N'Phạm Thu Dung', N'Nữ', N'Hồ Chí Minh', 'dung.pham@gmail.com', '0934567890'),
    (N'Hoàng Văn Em', 'Nam', N'Cần Thơ', 'em.hoang@company.vn', '0945678901');
GO

-- 2. Thêm dữ liệu bảng SanPham (5 bản ghi)
-- Giả sử ID sẽ tự tăng từ 1 đến 5
INSERT INTO SanPham (TenSP, MoTa, DonGia)
VALUES
    (N'Laptop Dell XPS', N'Laptop văn phòng mỏng nhẹ', 25000000), -- ID 1
    (N'Chuột Logitech G102', N'Chuột Gaming giá rẻ', 400000),      -- ID 2
    (N'Bàn phím cơ Keychron', N'Bàn phím cơ không dây', 1500000),  -- ID 3
    (N'Màn hình LG 24 inch', N'Màn hình IPS 75Hz', 3000000),       -- ID 4
    (N'Tai nghe Sony WH-1000', N'Tai nghe chống ồn', 5000000);     -- ID 5
GO

-- 3. Thêm dữ liệu bảng DonHang (5 bản ghi)
-- Tổng tiền ở đây tôi tính sẵn dựa trên dữ liệu sẽ nhập vào bảng SP_DonHang
INSERT INTO DonHang (IDKhachHang, NgayDatHang, TongTien)
VALUES
    (1, '2023-11-01', 25400000), -- Ông An mua Laptop + Chuột
    (2, '2023-11-02', 1500000),  -- Bà Bích mua Bàn phím
    (3, '2023-11-05', 6000000),  -- Ông Cường mua 2 Màn hình
    (1, '2023-11-10', 5000000),  -- Ông An mua thêm Tai nghe
    (4, '2023-11-12', 5400000);  -- Bà Dung mua Tai nghe + Chuột
GO

-- 4. Thêm dữ liệu bảng SP_DonHang (10 bản ghi)
-- Logic: IDDonHang tham chiếu bảng DonHang, IDSanPham tham chiếu bảng SanPham
INSERT INTO SP_DonHang (IDDonHang, IDSanPham, SoLuong, ThanhTien)
VALUES
-- Đơn hàng 1 (Của ông An - Tổng 25tr4)
(1, 1, 1, 25000000), -- 1 Laptop (25tr)
(1, 2, 1, 400000),   -- 1 Chuột (400k)

-- Đơn hàng 2 (Của bà Bích - Tổng 1tr5)
(2, 3, 1, 1500000),  -- 1 Bàn phím (1tr5)

-- Đơn hàng 3 (Của ông Cường - Tổng 6tr)
(3, 4, 2, 6000000),  -- 2 Màn hình (3tr x 2)

-- Đơn hàng 4 (Của ông An mua thêm - Tổng 5tr)
(4, 5, 1, 5000000),  -- 1 Tai nghe (5tr)

-- Đơn hàng 5 (Của bà Dung - Tổng 5tr4)
(5, 5, 1, 5000000),  -- 1 Tai nghe (5tr)
(5, 2, 1, 400000),   -- 1 Chuột (400k)

-- Giả sử có thêm Đơn hàng 6, 7 (Nếu bạn insert thêm DonHang)
-- Hoặc nhồi thêm vào các đơn cũ để đủ 10 dòng theo yêu cầu:
(2, 2, 2, 800000),   -- Đơn 2 mua thêm 2 chuột
(3, 2, 1, 400000),   -- Đơn 3 mua thêm 1 chuột
(4, 3, 1, 1500000);  -- Đơn 4 mua thêm 1 bàn phím
GO