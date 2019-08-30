USE [student]
GO

/****** Object:  View [dbo].[学生表]    Script Date: 08/28/2019 16:47:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[学生表]
AS
SELECT     id AS 编号,  age AS 年龄, name AS 姓名, pwd AS 密码, addess AS 所在区域
FROM         dbo.Table4


GO


