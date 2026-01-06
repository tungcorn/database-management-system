create table KhachHang
(
    IDKhachHang int IDENTITY (1, 1) PRIMARY KEY,
    HoTen       nvarchar(100) NOT NULL,
    GioiTinh    nvarchar(10)  NOT NULL CHECK (GioiTinh in ('Nam', N'Nữ')),
    DiaChi      nvarchar(255) NOT NULL,
    Email       nvarchar(100) NOT NULL UNIQUE CHECK (Email like '%_@_%'),
    SoDienThoai varchar(12)   NOT NULL
)
go

create table SanPham
(
    IDSanPham int identity (1, 1) primary key,
    TenSP     nvarchar(100) not null,
    MoTa      nvarchar(255) not null,
    DonGia    float         not null
)
go

create table DonHang
(
    IDDonHang   int identity (1,1) primary key,
    IDKhachHang int,
    NgayDatHang datetime not null,
    TongTien    float,
    FOREIGN KEY (IDKhachHang) references KhachHang (IDKhachHang)
)

go

create table SP_DonHang
(
    IDDonHang int,
    IDSanPham int,
    SoLuong   int   not null,
    ThanhTien float not null,
    primary key (IDDonHang, IDSanPham),
    foreign key (IDDonHang) references DonHang (IDDonHang),
    foreign key (IDSanPham) references SanPham (IDSanPham)
)

