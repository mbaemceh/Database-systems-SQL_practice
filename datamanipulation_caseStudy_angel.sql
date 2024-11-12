--	STUDY CASE WEEK 07
--	Agym Dimas Tian						 -		00000058149
--	Angeline Marcellina Chandrawijaya	 -		00000057862
--	Benz Martheen Walter Jonash			 -		00000059822
--	Jericho Alexander Gunawan			 -		00000058345
--  Muhammad Alvin Versa Ramadhan		 -		00000059444
--	Nicholas Suwandi Wijaya				 -		00000057903
--	Rheinald Adyatma Rizqi Wibowo		 -		00000058204

-- Pembuatan Database
CREATE DATABASE StudyCase07
GO

-- Penggunaan Database
USE StudyCase07
GO

-- b. Construct DDL Query from Case

-- Bank Table
CREATE TABLE Bank
(
	BankID	CHAR(3) NOT NULL,
	BankName VARCHAR(50) NOT NULL,
	PRIMARY KEY	(BankID)
)
GO

-- Photographer Table
CREATE TABLE Photographer
(
	PhotographerID CHAR(5) NOT NULL,
	PhotographerName VARCHAR(50) NOT NULL,
	PhotographerGender CHAR(1) NOT NULL CHECK (PhotographerGender = 'M' OR PhotographerGender = 'F'),
	PhotographerAddress	VARCHAR(50)	NOT NULL,
	PhotographerEmail VARCHAR(50) NOT NULL,
	Skill VARCHAR(50) NOT NULL,
	Camera VARCHAR(50) NOT NULL,
	Lens VARCHAR(50) NOT NULL,
	Equipment VARCHAR(50) NOT NULL,
	AccountNumber VARCHAR(50) NOT NULL,
	BankID CHAR(3) NOT NULL,
	Descriptions TEXT NOT NULL,
	PRIMARY KEY	(PhotographerID),
	FOREIGN KEY	(BankID) REFERENCES Bank
)
GO

-- Portfolio Album Table
CREATE TABLE PortfolioAlbum
(
	PortfolioAlbumID CHAR(5) NOT NULL,
	PhotographerID CHAR(5) NOT NULL,
	AlbumTitle VARCHAR(50) NOT NULL,
	CreatedDate DATE NOT NULL,
	Photo IMAGE NOT NULL,
	Descriptions TEXT NOT NULL,
	PRIMARY KEY	(PortfolioAlbumID),
	FOREIGN KEY	(PhotographerID) REFERENCES Photographer
)
GO

-- Customer Table
CREATE TABLE Customer
(
	CustID CHAR(5) NOT NULL,
	CustName VARCHAR(50) NOT NULL,
	CustGender CHAR(1) NOT NULL CHECK (CustGender = 'M' OR CustGender = 'F'),
	CustAddress	VARCHAR(50)	NOT NULL,
	CustEmail VARCHAR(50) NOT NULL,
	Instagram VARCHAR(50) NOT NULL,
	Facebook VARCHAR(50) NOT NULL,
	Twitter	VARCHAR(50)	NOT NULL,
	PRIMARY KEY (CustID)
);
GO

-- Transaction Table
CREATE TABLE Transactions
(
	TransactionID CHAR(5) NOT NULL,
	CustID CHAR(5) NOT NULL,
	PhotographerID CHAR(5) NOT NULL,
	EventDate DATE NOT NULL,
	EventTime TIME(1) NOT NULL,
	Duration TIME NOT NULL,
	PlaceName VARCHAR(50) NOT NULL,
	Locations VARCHAR(50) NOT NULL,
	BookingDate DATE NOT NULL,
	PRIMARY KEY	(TransactionID),
	FOREIGN KEY	(PhotographerID) REFERENCES Photographer,
	FOREIGN KEY	(CustID) REFERENCES Customer
)
GO

-- Payment Table
CREATE TABLE Payment
(
	PaymentID CHAR(5) NOT NULL,
	TransactionID CHAR(5) NOT NULL,
	PaymentDate DATE NOT NULL,
	AmmountofPayment INT NOT NULL,
	PaymentMethod VARCHAR(50) NOT NULL,
	PaymentStatus VARCHAR(10) NOT NULL,
	PRIMARY KEY	(PaymentID),
	FOREIGN KEY	(TransactionID) REFERENCES Transactions
)
GO


-- c. Construct DML Query from Case

-- Bank Table
INSERT INTO Bank VALUES ('009','Bank Bukopin')
INSERT INTO Bank VALUES ('002','Bank Muamalat')
INSERT INTO Bank VALUES ('014','Bank Citibank')
INSERT INTO Bank VALUES ('008','Bank Permata')
INSERT INTO Bank VALUES ('022','Bank Central Asia')

-- Photographer Table
INSERT INTO Photographer VALUES ('PG001','Sutomo','M','Tangerang','sutomomo123@gmail.com','Panaromic','Nikon Digital D6', 'Nikon 100mm','Camera, Lens, Memory Card, Extra Batteries, Flash','0374387432','009','Lulusan S1 Sistem Informasi Universitas Multimedia Nusantara' )
INSERT INTO Photographer VALUES ('PG002','Agus','M','Tangerang','agusgemink@gmail.com','Fisheye','Nikon D500','Nikon A 250-300mm','Camera, Lens, Memory Card','01110202','002','Lulusan S1 Sistem Informasi Universitas Multimedia Nusantara')
INSERT INTO Photographer VALUES ('PG003','Jomon','M','Tangerang','jomon69@gmail.com','Jump Shot','Canon 600D','Canon 600mm', 'Camera, Lens, Memory Card','87350895634342','014','Lulusan S1 Sistem Informasi Universitas Multimedia Nusantara')
INSERT INTO Photographer VALUES ('PG004','Jalaiman','M','Tangerang','jalaimanhd@gmail.com','Auto Lock','Sony A55',' Sony 1000mm','Camera, Lens, Memory Card, Flash','451000967343434317','008','Lulusan S1 Sistem Informasi Universitas Multimedia Nusantara')
INSERT INTO Photographer VALUES ('PG005','Budi','M','Tangerang','budi.aja@gmail.com','Blurry Shot','Canon EOS 5D','Canon 30-50mm','Camera, Lens, Memory Card, Extra Batteries, Flash','66546424139','022','Lulusan S1 Sistem Informasi Universitas Multimedia Nusantara')

-- Portfolio Album Table
INSERT INTO PortfolioAlbum VALUES('PF001','PG001','Murder','24-JAN-2004','001.jpg','Rengoku');
INSERT INTO PortfolioAlbum VALUES('PF002','PG002','Psychological','29-FEB-2020','002.jpg','Keanu Reeves');
INSERT INTO PortfolioAlbum VALUES('PF003','PG003','Thriller','03-JUL-2008','003.jpg','Tom Cruise');
INSERT INTO PortfolioAlbum VALUES('PF004','PG004','Futuristic','20-JUN-1900','004.jpg','Liam Neeson');
INSERT INTO PortfolioAlbum VALUES('PF005','PG005','Traditional','17-SEP-1988','005.jpg','Uya Kuya');

-- Customer Table
INSERT INTO Customer VALUES('CM001', 'Eko Patriot','M', 'Kelapa Dua Street','ekoprapar@gmail.com','ekokpatrio.t', 'Eko Ptriot', 'ekokokopar')
INSERT INTO Customer VALUES('CM002', 'Segar Sebastian','M', 'Padegangan Street','segarsegarbas@gmail.com','segarisebas', 'Segar Sebastian', 'segarduluges')
INSERT INTO Customer VALUES('CM003', 'Sundo Kelapo','M', 'BSD Street','sundo_kelopo@gmail.com','sund0_kel4p4', 'Sundo Kelapo', 'sundasundo_')
INSERT INTO Customer VALUES('CM004', 'Bagas Permata','M', 'Bintaro Street','bagasbanget@gmail.com','bagasmp3', 'Bagas Permata', 'bagagata_')
INSERT INTO Customer VALUES('CM005', 'Livi Renata','F', 'Alam Sutra Street','livirenataa@gmail.com','livirenataa', 'Livi Renata', 'renlip')

-- Transaction Table
INSERT INTO Transactions VALUES ('TR001','CM001','PG001','24-JAN-2004','18:00','06:00:00','Rumah Kentang','Bandung','24-JAN-2004')
INSERT INTO Transactions VALUES ('TR002','CM002','PG002','29-DEC-2020','14:00','02:00:00','Universitas Multimedia Nusantara','Tangerang Selatan','29-DEC-2020')
INSERT INTO Transactions VALUES ('TR003','CM003','PG003','03-JUL-2008','22:00','10:40:00','Kuburan Kebon Jeruk','Jakarta Barat','03-JUL-2008')
INSERT INTO Transactions VALUES ('TR004','CM004','PG004','20-JUN-1900','11:00','11:00:00','Summarecon Mall Serpong','Tangerang Selatan','20-JUN-1900')
INSERT INTO Transactions VALUES ('TR005','CM005','PG005','17-SEP-1988','16:00','04:00:00','Pasar Serpong','Tangerang Selatan','17-SEP-1988')

-- Payment Table
INSERT INTO Payment VALUES ('PY001','TR001','24-JAN-2004','8500000','LOCAL BANK','DONE')
INSERT INTO Payment VALUES ('PY002','TR002','29-DEC-2020','5000000','LOCAL BANK','WAITING')
INSERT INTO Payment VALUES ('PY003','TR003','03-JUL-2008','9550000','LOCAL BANK','DONE')
INSERT INTO Payment VALUES ('PY004','TR004','20-JUN-1900','2300000','LOCAL BANK','DONE')
INSERT INTO Payment VALUES ('PY005','TR005','17-SEP-1988','7500000','LOCAL BANK','WAITING')

-- SELECT
Select * From Bank
GO
Select * From Photographer
GO
Select * From PortfolioAlbum
GO
Select * From Customer
GO
Select * From Transactions
GO
Select * From Payment
GO

--Tampilkan Jumlah Biaya Pembayaran Terkecil, Terbesar dan juga Rata-rata dari Transaksi Pembayaran yang ada pada Tabel Payment
SELECT MIN(AmmountofPayment) AS TransaksiPembayaranTerkecil,
       MAX(AmmountofPayment) AS TransaksiPembayaranTerbesar,
       AVG(AmmountofPayment) AS RatarataTransaksiPembayaran
FROM Payment
GO

-- Tampilkan CustID, CustName, PhotographerID, PhotographerName, EventDate dan Locations dimana EventDate lebih dari pada 2018
SELECT a.CustID, a.CustName, b.PhotographerID, b.PhotographerName, c.EventDate, c.Locations
FROM Customer a
JOIN Transactions c
ON a.CustID = c.CustID
JOIN Photographer b
ON b.PhotographerID = c.PhotographerID
WHERE YEAR (EventDate) > 2018
GO

-- Tampilkan CustName, CustGender, EventDate dan Location dimana EventDate lebih dari pada 2018
SELECT x.CustName, x.CustGender, y.EventDate, y.Locations, y.CustID
FROM Customer x JOIN Transactions y
ON x.CustID = y.CustID
WHERE YEAR (EventDate) > 2018
GO

--Menggabungkan Tabel Photographer dengan Bank dan diurutkan dengan PhotographerID secara Ascending
SELECT a.PhotographerID, a.PhotographerName, a.PhotographerGender, a.AccountNumber, a.BankID, b.BankName
FROM Photographer a JOIN Bank b
ON a.BankID = b.BankID
ORDER BY a.PhotographerID ASC
GO

--Mengurutkan Nama-nama Photographer dari A sampai Z
SELECT PhotographerID, PhotographerName, PhotographerGender, PhotographerAddress, PhotographerEmail, Skill, Camera, Lens, Equipment, AccountNumber, BankID, Descriptions
FROM Photographer
ORDER BY PhotographerName ASC
GO

--Tampilkan Tanggal Booking yang dilakukan pada awal tahun 2020 sampai akhir tahun 2021
SELECT TransactionID, CustID, PhotographerID, EventDate, EventTime, Duration, PlaceName, Locations, BookingDate
FROM Transactions
WHERE YEAR (BookingDate) BETWEEN 2020 AND 2021
GO

-- Mengganti address salah satu photographer yang mempunyai ID 'PG002' menjadi 'Mars' dan gender menjadi 'F'
UPDATE Photographer
SET PhotographerAddress = 'Mars'
WHERE PhotographerID = 'PG002'

UPDATE Photographer
SET PhotographerGender = 'F'
WHERE PhotographerID = 'PG002'
GO