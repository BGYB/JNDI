USE [student]
GO

/****** Object:  View [dbo].[V_ϵͳ_���ݿ������¼]    Script Date: 08/28/2019 16:45:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_ϵͳ_���ݿ������¼]
AS
SELECT DL_SQL AS �������, DL_USER_ID AS �û�����, DL_IP AS IP��ַ, 
      DL_TIME AS ִ��ʱ��
FROM dbo.DB_LOG


GO


