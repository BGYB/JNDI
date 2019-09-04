USE [student]
GO

/****** Object:  Table [dbo].[Njb]    Script Date: 09/04/2019 10:44:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Njb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nj] [nchar](20) NOT NULL,
	[tid] [int] NOT NULL,
	[userid] [int] NULL,
 CONSTRAINT [PK_Njb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


