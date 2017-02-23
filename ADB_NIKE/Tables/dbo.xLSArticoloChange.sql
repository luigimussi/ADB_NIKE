SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xLSArticoloChange] (
		[Id_xLSArticoloChange]     [int] IDENTITY(1, 1) NOT NULL,
		[UserIns]                  [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                  [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                  [smalldatetime] NOT NULL,
		[TimeUpd]                  [smalldatetime] NOT NULL,
		[Ts]                       [timestamp] NOT NULL,
		[DataChange]               [smalldatetime] NOT NULL,
		[UserChange]               [varchar](48) COLLATE Latin1_General_CI_AS NULL,
		[Id_LSArticolo]            [int] NULL,
		[Cd_AR]                    [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[PrezzoOld]                [numeric](18, 6) NOT NULL,
		[PrezzoNew]                [numeric](18, 6) NOT NULL,
		[Id_LSRevisione]           [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [PK_xLSArticoloChange]
	PRIMARY KEY
	NONCLUSTERED
	([Id_xLSArticoloChange])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_DataChange]
	DEFAULT (getdate()) FOR [DataChange]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_PrezzoNew]
	DEFAULT ((0)) FOR [PrezzoNew]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_PrezzoOld]
	DEFAULT ((0)) FOR [PrezzoOld]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[xLSArticoloChange]
	ADD
	CONSTRAINT [DF_xLSArticoloChange_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tabella per inserire i cambiamenti del prezzo nella LSArticolo', 'SCHEMA', N'dbo', 'TABLE', N'xLSArticoloChange', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[xLSArticoloChange]
	TO [public]
GO
ALTER TABLE [dbo].[xLSArticoloChange] SET (LOCK_ESCALATION = TABLE)
GO
