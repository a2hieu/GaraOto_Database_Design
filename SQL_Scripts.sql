-- =========================================
-- 🚗 Gara Ô Tô Database - SQL Script
-- Author: <Phạm Duy Hiếu>
-- Description: Script tạo CSDL & dữ liệu mẫu
-- =========================================

-- 1️ Tạo Database
CREATE DATABASE GaraOtoDB;
GO

USE GaraOtoDB;
GO

-- 2️ Tạo các bảng chính
CREATE TABLE KhachHang (
    KhachHangID INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    DiaChi NVARCHAR(255)
);

CREATE TABLE Xe (
    XeID INT PRIMARY KEY IDENTITY(1,1),
    BienSoXe VARCHAR(20) NOT NULL,
    HieuXe NVARCHAR(50),
    MauXe NVARCHAR(50),
    NamSX INT,
    KhachHangID INT FOREIGN KEY REFERENCES KhachHang(KhachHangID)
);

CREATE TABLE DichVu (
    DichVuID INT PRIMARY KEY IDENTITY(1,1),
    TenDichVu NVARCHAR(100),
    DonGia DECIMAL(18,2)
);

CREATE TABLE HoaDon (
    HoaDonID INT PRIMARY KEY IDENTITY(1,1),
    NgayLap DATE NOT NULL,
    TongTien DECIMAL(18,2),
    KhachHangID INT FOREIGN KEY REFERENCES KhachHang(KhachHangID)
);

CREATE TABLE HoaDonChiTiet (
    HoaDonID INT,
    DichVuID INT,
    SoLuong INT,
    DonGia DECIMAL(18,2),
    PRIMARY KEY (HoaDonID, DichVuID),
    FOREIGN KEY (HoaDonID) REFERENCES HoaDon(HoaDonID),
    FOREIGN KEY (DichVuID) REFERENCES DichVu(DichVuID)
);

-- 3️ Thêm dữ liệu mẫu
INSERT INTO KhachHang (HoTen, SoDienThoai, DiaChi)
VALUES 
(N'Nguyễn Văn A', '0909123456', N'Quận 1, TP.HCM'),
(N'Trần Thị B', '0912345678', N'Quận Bình Thạnh, TP.HCM');

INSERT INTO Xe (BienSoXe, HieuXe, MauXe, NamSX, KhachHangID)
VALUES 
('51H-12345', N'Toyota Vios', N'Đỏ', 2020, 1),
('59X-67890', N'Honda Civic', N'Đen', 2019, 2);

INSERT INTO DichVu (TenDichVu, DonGia)
VALUES 
(N'Thay nhớt', 350000),
(N'Rửa xe', 50000),
(N'Bảo dưỡng định kỳ', 1500000);

INSERT INTO HoaDon (NgayLap, TongTien, KhachHangID)
VALUES 
('2025-08-01', 400000, 1);

INSERT INTO HoaDonChiTiet (HoaDonID, DichVuID, SoLuong, DonGia)
VALUES 
(1, 1, 1, 350000),
(1, 2, 1, 50000);

-- 4️ Kiểm tra dữ liệu mẫu
SELECT * FROM KhachHang;
SELECT * FROM Xe;
SELECT * FROM DichVu;
SELECT * FROM HoaDon;
SELECT * FROM HoaDonChiTiet;
