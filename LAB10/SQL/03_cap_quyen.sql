USE [LAB1_MaHoaCoDien];
GO
-- Tạo login lab1_user trong SSMS trước khi chạy tệp này.
IF SUSER_ID(N'lab1_user') IS NULL
    THROW 50001, N'Hãy tạo login lab1_user trong SSMS trước.', 1;
IF DATABASE_PRINCIPAL_ID(N'lab1_user') IS NULL
    CREATE USER [lab1_user] FOR LOGIN [lab1_user];
GRANT SELECT, INSERT ON OBJECT::dbo.history TO [lab1_user];
GO
