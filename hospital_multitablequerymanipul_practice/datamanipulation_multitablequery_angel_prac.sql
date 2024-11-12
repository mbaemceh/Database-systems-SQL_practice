--part1
--a
SELECT MedicineID, MedicineName
FROM MsMedicine a, MsMedicineType b
WHERE a.MedicineTypeID = b.MedicineTypeID AND MedicineTypeName IN ('Balm');

--b
SELECT DoctorID, DoctorName, DoctorPhone, YEAR(DoctorBirthDate) AS DoctorBirthYear
FROM MsDoctor 
WHERE DoctorID NOT IN (SELECT DoctorID FROM TransactionHeader)

--c 
SELECT MedicineName, MedicineTypeName, MedicinePrice
FROM MsMedicine a, MsMedicineType b 
WHERE EXISTS ( SELECT MONTH (d.TransactionDate) FROM TransactionDetail c, TransactionHeader d
WHERE a.MedicineTypeID = b.MedicineTypeID
AND a.MedicineID = c.MedicineID AND c.TransactionID = d.TransactionID AND MONTH(TransactionDate) = 12)

--d
SELECT MedicineiD, MedicineName, CAST(CONCAT('Rp.', MedicinePrice ) as VARCHAR ) AS MedicinePrice
FROM MsMedicine a
WHERE NOT EXISTS (SELECT b.TransactionID, b.MedicineID, c.DoctorID FROM TransactionDetail b, TransactionHeader c 
WHERE c.TransactionID = b.TransactionID AND b.MedicineID = a.MedicineID AND c.DoctorID LIKE 'DC001')

--e
SELECT DISTINCT a.PatientID, a.PatientName, YEAR(a.PatientBirthDate) AS PatientBirthYear
FROM MsPatient a, MsDoctor b, TransactionHeader c 
WHERE a.PatientID = c.PatientID AND b.DoctorID = c.DoctorID 
AND YEAR(a.PatientBirthDate) IN (SELECT YEAR(PatientBirthDate)
WHERE YEAR(PatientBirthDate) < YEAR(DoctorBirthDate))

--f
SELECT TransactionID, CONVERT(varchar, TransactionDate, 102) AS TransactionDate
FROM TransactionHeader a
WHERE EXISTS (SELECT a.TransactionID, a.TransactionDate
FROM MsMedicine b, MsMedicineType c, TransactionDetail d WHERE b.MedicineTypeID = c.MedicineTypeID 
AND d.TransactionID = a.TransactionID AND d.MedicineID = b.MedicineID AND c.MedicineTypeName NOT LIKE 'Syrup' 
AND b.MedicinePrice IN (SELECT MedicinePrice FROM MsMedicine WHERE MedicinePrice > 15000))

--g
SELECT PatientID, PatientName, REPLACE(PatientAddress, 'street', '') AS PatientRoadAddress
FROM MsPatient
WHERE LEN(PatientName) > (SELECT AVG(LEN(PatientName)) FROM MsPatient)

--h
SELECT PatientName, CONVERT(varchar, PatientBirthDate, 3) AS PatientBirthDate, PatientAddress
FROM MsPatient a, MsDoctor b, TransactionHeader c
WHERE a.PatientID = c.PatientID AND b.DoctorID = c.DoctorID AND
DAY(TransactionDate) IN (SELECT DAY(TransactionDate) FROM TransactionHeader 
WHERE DAY(TransactionDate) BETWEEN '15' AND '25' AND (b.DoctorName LIKE '%k%' 
OR b.DoctorName LIKE '%j%')) 

--i
SELECT a.PatientID, PatientName, LEFT(UPPER(PatientName), 2) AS Initial,
PatientBirthDate, (SELECT CAST(CONCAT(COUNT(b.TransactionID), ' Transaction(s)') 
AS varchar)) AS TransactionCount
FROM MsPatient a, TransactionHeader b
WHERE a.PatientID = b.PatientID
GROUP BY a.PatientID, PatientName, PatientBirthDate

--j
SELECT DoctorID, DoctorName, CONVERT(varchar, DoctorBirthDate, 9)
FROM MsDoctor
WHERE YEAR(DoctorBirthDate) LIKE (SELECT MIN(YEAR(DoctorBirthDate)) FROM MsDoctor)
OR YEAR(DoctorBirthDate) LIKE (SELECT MAX(YEAR(DoctorBirthDate)) FROM MsDoctor)

--part2
--a 
SELECT a.MedicineID, a.MedicineName, b.MedicineTypeName, a.MedicineStock
FROM MsMedicine a JOIN MsMedicineType b
ON a.MedicineTypeID = b.MedicineTypeID 
WHERE LEN(MedicineName) > 10;

--b 
SELECT a.DoctorID, DoctorName, TransactionID, TransactionDate
FROM MsDoctor a LEFT JOIN TransactionHeader b
ON a.DoctorID = b.DoctorID
WHERE  b.TransactionID IS NULL

--c
SELECT DISTINCT a.PatientID, PatientName, b.TransactionID
FROM MsPatient a JOIN TransactionHeader b
ON a.PatientID = b.PatientID
JOIN TransactionDetail c
ON c.TransactionID = b.TransactionID
WHERE MONTH(b.TransactionDate) BETWEEN 3 AND 7 AND c.MedicineID LIKE 'ME001'

--d
SELECT a.TransactionID, DoctorName, TransactionDate, MedicineName, Quantity
FROM TransactionHeader a JOIN TransactionDetail b
ON a.TransactionID = b.TransactionID
JOIN MsMedicine c
ON c.MedicineID = b.MedicineID
JOIN MsDoctor d
ON d.DoctorID = a.DoctorID
WHERE c.MedicineName LIKE '%l' AND b.Quantity > 5
--e
SELECT DISTINCT a.TransactionID, b.PatientID, PatientName, b.DoctorID, DoctorName
FROM TransactionDetail a JOIN TransactionHeader b
ON a.TransactionID = b.TransactionID
JOIN MsPatient c
ON b.PatientID = c.PatientID
JOIN MsDoctor d 
ON b.DoctorID = d.DoctorID
WHERE d.DoctorName IN (SELECT DoctorName FROM MsDoctor WHERE DoctorName NOT LIKE 
'% s%' AND DoctorName NOT LIKE  '% p%')
AND a.Quantity IN (SELECT Quantity FROM TransactionDetail WHERE Quantity % 5 = 0)

--f 
SELECT PatientID, PatientName AS 'Name' FROM MsPatient a WHERE PatientName NOT LIKE '% %'
UNION
SELECT DoctorID, DoctorName AS 'Code' FROM MsDoctor b WHERE DoctorName NOT LIKE '% %'

--g
SELECT MedicineID, MedicineName, MedicineTypeName, MedicinePrice FROM MsMedicine a, MsMedicineType b
WHERE a.MedicineTypeID = b.MedicineTypeID AND MedicineName LIKE '[A-E]%'
UNION 
SELECT MedicineID, MedicineName, MedicineTypeName, MedicinePrice FROM MsMedicine a , MsMedicineType b 
WHERE a.MedicineTypeID = b.MedicineTypeID AND LEN(MedicineName) LIKE LEN(MedicineTypeName)

--h
SELECT DoctorName AS Name, DoctorAddress AS Address, CONVERT(varchar, DoctorBirthDate, 121) AS BirthDate
FROM MsDoctor a JOIN TransactionHeader b ON b.DoctorID = a.DoctorID 
WHERE RIGHT(TransactionID, 3) % 3 = 0
UNION 
Select PatientName, PatientAddress, PatientBirthDate
FROM MsPatient a JOIN TransactionHeader b
ON a.PatientID = b.PatientID
WHERE DATEDIFF(year, PatientBirthDate, TransactionDate) < 10
ORDER BY DoctorName DESC
--i
SELECT SUBSTRING(DoctorName, CHARINDEX(' ', DoctorName), 30) AS Name, REPLACE(DoctorPhone, '+62', '0') AS Phone
FROM MsDoctor a, TransactionHeader b, TransactionDetail c,  MsMedicine d, MsMedicineType e
WHERE a.DoctorID = b.DoctorID AND b.TransactionID = c.TransactionID AND c.MedicineID = d.MedicineID
AND d.MedicineTypeID = e.MedicineTypeID AND e.MedicineTypeID LIKE 'MT003'
UNION
SELECT SUBSTRING(PatientName, CHARINDEX(' ', PatientName), 30), PatientPhone 
FROM MsPatient a, TransactionHeader b
WHERE a.PatientID = b.PatientID AND MONTH(PatientBirthDate) LIKE MONTH(TransactionDate)

--j
SELECT DISTINCT a.DoctorID, DoctorName, (SELECT COUNT(TransactionID)) AS TransactionHandled
FROM MsDoctor a, TransactionHeader b
WHERE a.DoctorID = b.DoctorID AND YEAR(TransactionDate) LIKE 2012
GROUP BY a.DoctorID, DoctorName