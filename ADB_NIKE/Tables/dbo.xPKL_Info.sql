SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xPKL_Info] (
		[Id_xPKL_Info]           [int] IDENTITY(1, 1) NOT NULL,
		[UserIns]                [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                [smalldatetime] NOT NULL,
		[TimeUpd]                [smalldatetime] NOT NULL,
		[Ts]                     [timestamp] NOT NULL,
		[PKL_Show_NameField]     [nvarchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
		[Riga]                   [tinyint] NOT NULL,
		[Descrizione]            [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
		[CaptionXLS]             [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
		[colWidth]               [smallint] NULL,
		[rowHeight]              [smallint] NULL,
		[numFormat]              [varchar](20) COLLATE Latin1_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [PK_xPKL_Info]
	PRIMARY KEY
	NONCLUSTERED
	([Id_xPKL_Info])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_CaptionXLS]
	DEFAULT ('') FOR [CaptionXLS]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_Descrizione]
	DEFAULT ('') FOR [Descrizione]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_PKL_Show_NameField]
	DEFAULT ('') FOR [PKL_Show_NameField]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_Riga]
	DEFAULT ((0)) FOR [Riga]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[xPKL_Info]
	ADD
	CONSTRAINT [DF_xPKL_Info_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
GRANT SELECT
	ON [dbo].[xPKL_Info]
	TO [public]
GO
ALTER TABLE [dbo].[xPKL_Info] SET (LOCK_ESCALATION = TABLE)
GO
