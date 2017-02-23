SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LS] (
		[Id_LS]           [int] IDENTITY(1, 1) NOT NULL,
		[Cd_LS]           [char](7) COLLATE Latin1_General_CI_AS NOT NULL,
		[Descrizione]     [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_VL]           [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[Ivato]           [bit] NOT NULL,
		[TipoLS]          [tinyint] NOT NULL,
		[Sconto]          [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[Provvigione]     [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserIns]         [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]         [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]         [smalldatetime] NOT NULL,
		[TimeUpd]         [smalldatetime] NOT NULL,
		[ts]              [timestamp] NULL,
		[Avanzato]        [bit] NOT NULL,
		[Note_LS]         [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[xUIShowInAR]     [xml] NULL,
		CONSTRAINT [IK_LS]
		UNIQUE
		NONCLUSTERED
		([Id_LS])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [PK_LS]
	PRIMARY KEY
	CLUSTERED
	([Cd_LS])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [CK_LS_Cd_LS]
	CHECK
	([Cd_LS] <> '')
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900941 | Cd_LS', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'CONSTRAINT', N'CK_LS_Cd_LS'
GO
ALTER TABLE [dbo].[LS]
CHECK CONSTRAINT [CK_LS_Cd_LS]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [CK_LS_Provvigione]
	CHECK
	([dbo].[afn_PercStrValid]([Provvigione])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | Provvigione', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'CONSTRAINT', N'CK_LS_Provvigione'
GO
ALTER TABLE [dbo].[LS]
CHECK CONSTRAINT [CK_LS_Provvigione]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [CK_LS_Sconto]
	CHECK
	([dbo].[afn_PercStrValid]([Sconto])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | Sconto', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'CONSTRAINT', N'CK_LS_Sconto'
GO
ALTER TABLE [dbo].[LS]
CHECK CONSTRAINT [CK_LS_Sconto]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [CK_LS_TipoLS]
	CHECK
	([TipoLS]=(2) OR [TipoLS]=(1) OR [TipoLS]=(0))
GO
ALTER TABLE [dbo].[LS]
CHECK CONSTRAINT [CK_LS_TipoLS]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [CK_LS_xUIShowInAR]
	CHECK
	([xUIShowInAR] IS NOT NULL AND [Avanzato]=(0) OR [xUIShowInAR] IS NULL)
GO
ALTER TABLE [dbo].[LS]
CHECK CONSTRAINT [CK_LS_xUIShowInAR]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_Avanzato]
	DEFAULT (1) FOR [Avanzato]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_Cd_VL]
	DEFAULT ('EUR') FOR [Cd_VL]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_Descrizione]
	DEFAULT ('') FOR [Descrizione]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_Ivato]
	DEFAULT (0) FOR [Ivato]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_Provvigione]
	DEFAULT ('') FOR [Provvigione]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_Sconto]
	DEFAULT ('') FOR [Sconto]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_TipoLS]
	DEFAULT (0) FOR [TipoLS]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[LS]
	ADD
	CONSTRAINT [DF_LS_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[LS]
	WITH NOCHECK
	ADD CONSTRAINT [FK_LS_VL]
	FOREIGN KEY ([Cd_VL]) REFERENCES [dbo].[VL] ([Cd_VL])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[LS]
	CHECK CONSTRAINT [FK_LS_VL]

GO
CREATE NONCLUSTERED INDEX [IX_LS_Cd_VL]
	ON [dbo].[LS] ([Cd_VL])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice valuta. ', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'Cd_VL'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizione del listino
Default SQL = '''' (vedi SetColumnDefault.sql)', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'Descrizione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'.T. se il listino risulta comprensivo di IVA!
Default SQL = 0 (vedi SetColumnDefault.sql)', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'Ivato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione per la % di provvigione (Es: 10 o 10+4 o 10+4-2)', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'Provvigione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione per la % di sconto (Es: 10 o 10+4 o 10+4-2)', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'Sconto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipo di listino: 1 Clienti, 2 Fornitori, 0 (default) entrambi', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'TipoLS'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Info per visualizzare il listino nella Fedi_Articolo', 'SCHEMA', N'dbo', 'TABLE', N'LS', 'COLUMN', N'xUIShowInAR'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900572', 'SCHEMA', N'dbo', 'TABLE', N'LS', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Definizione listini', 'SCHEMA', N'dbo', 'TABLE', N'LS', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[LS]
	TO [public]
GO
ALTER TABLE [dbo].[LS] SET (LOCK_ESCALATION = TABLE)
GO
