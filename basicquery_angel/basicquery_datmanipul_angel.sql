--A
SELECT DoctorID, DoctorName, DoctorPhone FROM MsDoctor;

--B
SELECT MedicineID, MedicineName, MedicinePrice FROM MsMedicine WHERE MedicineStock > 100;

--C
SELECT PatientName, PatientAddress FROM MsPatient WHERE YEAR (PatientBirthDate) > 2000;

--D
SELECT PatientID, PatientName, PatientPhone FROM MsPatient WHERE LEFT (PatientPhone, 3) = 021;

--E
SELECT TransactionID, TransactionDate FROM TransactionHeader WHERE MONTH (TransactionDate) BETWEEN 5 AND 7;

--F
SELECT DoctorID, DoctorName, DoctorAddress FROM MsDoctor 
WHERE DoctorName LIKE 'a%' 
OR DoctorName LIKE 'i%' 
OR DoctorName LIKE 'u%' 
OR DoctorName LIKE 'e%' 
OR DoctorName LIKE 'o%';

--G
SELECT REPLACE ('PatientID','PA','Patient#') AS PatientNumber, PatientName, PatientAddress
FROM MsPatient
--Menghitung panjang kata 'LEN'
WHERE LEN (PatientAddress) - LEN(REPLACE(PatientAddress,' ','')) +1 >= 3;

--H
SELECT TransactionID, TransactionDate FROM TransactionHeader WHERE RIGHT (DoctorID, 3) %2 = 0
ORDER BY TransactionDate ASC;

--I
SELECT a.PatientID, a.PatientName, a.PatientBirthDate, b.TransactionDate FROM MsPatient a JOIN TransactionHeader b
ON a.PatientID = b.PatientID
WHERE DATEDIFF (YEAR, a.PatientBirthDate, b.TransactionDate) < 17
ORDER BY a.PatientBirthDate DESC;

--J
SELECT MedicineID, MedicineName, UPPER(mt.MedicineTypeName) AS TypeName, CONCAT(MedicineStock, 'pcs') AS MedicineStock
FROM MsMedicine ft
JOIN MsMedicineType mt ON ft.MedicineTypeID = mt.MedicineTypeID
WHERE MedicineStock % 25 = 0 AND LEN(MedicineName) < 10
ORDER BY MedicineName