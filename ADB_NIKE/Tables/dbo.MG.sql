SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MG] (
		[Id_MG]                         [int] IDENTITY(1, 1) NOT NULL,
		[Cd_MG]                         [char](5) COLLATE Latin1_General_CI_AS NOT NULL,
		[Descrizione]                   [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
		[Fiscale]                       [bit] NOT NULL,
		[NoteMG]                        [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[UserIns]                       [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                       [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                       [smalldatetime] NOT NULL,
		[TimeUpd]                       [smalldatetime] NOT NULL,
		[ts]                            [timestamp] NULL,
		[MG_UbicazioneObbligatoria]     [bit] NOT NULL,
		[xMostraSuAR]                   [bit] NOT NULL,
		CONSTRAINT [IK_MG]
		UNIQUE
		NONCLUSTERED
		([Id_MG])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [PK_MG]
	PRIMARY KEY
	CLUSTERED
	([Cd_MG])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [CK_MG_Cd_MG]
	CHECK
	([Cd_MG]=upper([Cd_MG]) collate Latin1_General_CS_AS AND [Cd_MG]<>'')
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900942 | Cd_MG', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'CONSTRAINT', N'CK_MG_Cd_MG'
GO
ALTER TABLE [dbo].[MG]
CHECK CONSTRAINT [CK_MG_Cd_MG]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_Descrizione]
	DEFAULT ('') FOR [Descrizione]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_Fiscale]
	DEFAULT ((0)) FOR [Fiscale]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_MG_UbicazioneObbligatoria]
	DEFAULT ((0)) FOR [MG_UbicazioneObbligatoria]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[MG]
	ADD
	CONSTRAINT [DF_MG_xMostraSuAR]
	DEFAULT ((0)) FOR [xMostraSuAR]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del magazzino.', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'Cd_MG'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizione del magazzino.', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'Descrizione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Non gestito: la decisione di quali magazzini considerare ai fini fiscali viene fatta al momento delle valorizzazioni stesse con richiesta all''operatore.', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'Fiscale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data inserimento del record.
', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'TimeIns'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data ultimo aggiornamento del record.', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'TimeUpd'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Utente che ha eseguito l''Inserimento del record.', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'UserIns'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Utente che ha eseguito l''ultimo aggiornamento del record.
', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'UserUpd'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mostra su Elenco Articoli', 'SCHEMA', N'dbo', 'TABLE', N'MG', 'COLUMN', N'xMostraSuAR'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900581', 'SCHEMA', N'dbo', 'TABLE', N'MG', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Magazzini', 'SCHEMA', N'dbo', 'TABLE', N'MG', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[MG]
	TO [public]
GO
ALTER TABLE [dbo].[MG] SET (LOCK_ESCALATION = TABLE)
GO
