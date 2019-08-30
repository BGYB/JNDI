USE [student]
GO

/****** Object:  View [dbo].[V_系统_数据库操作记录]    Script Date: 08/28/2019 16:45:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_系统_数据库操作记录]
AS
SELECT DL_SQL AS 命令语句, DL_USER_ID AS 用户代码, DL_IP AS IP地址, 
      DL_TIME AS 执行时间
FROM dbo.DB_LOG


GO


