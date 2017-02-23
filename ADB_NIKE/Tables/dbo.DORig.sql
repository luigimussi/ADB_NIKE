SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DORig] (
		[Id_DORig]                     [int] IDENTITY(1, 1) NOT NULL,
		[Id_DOTes]                     [int] NOT NULL,
		[Contabile]                    [bit] NOT NULL,
		[NumeroDoc]                    [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[DataDoc]                      [smalldatetime] NULL,
		[Cd_MGEsercizio]               [char](4) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DO]                        [char](3) COLLATE Latin1_General_CI_AS NULL,
		[TipoDocumento]                [char](1) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CF]                        [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_LS_C]                      [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_VL]                        [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cambio]                       [numeric](18, 6) NOT NULL,
		[Decimali]                     [tinyint] NOT NULL,
		[DecimaliPrzUn]                [tinyint] NOT NULL,
		[Riga]                         [smallint] NOT NULL,
		[Cd_MGCausale]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_MG_P]                      [char](5) COLLATE Latin1_General_CI_AS NULL,
		[Cd_MGUbicazione_P]            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Cd_MG_A]                      [char](5) COLLATE Latin1_General_CI_AS NULL,
		[Cd_MGUbicazione_A]            [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Cd_AR]                        [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Descrizione]                  [varchar](80) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARMisura]                  [char](2) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGConto]                   [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Aliquota]                  [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Aliquota_E]                [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Aliquota_R]                [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOSottoCommessa]           [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARLotto]                   [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[TipoRigaRif]                  [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[Qta]                          [numeric](18, 8) NOT NULL,
		[FattoreToUM1]                 [numeric](18, 8) NOT NULL,
		[QtaEvadibile]                 [numeric](18, 8) NULL,
		[Id_DORig_Evade]               [int] NULL,
		[QtaEvasa]                     [numeric](18, 8) NOT NULL,
		[PrezzoUnitarioV]              [numeric](18, 6) NOT NULL,
		[ScontoRiga]                   [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[PrezzoAddizionaleV]           [numeric](18, 6) NOT NULL,
		[PrezzoTotaleV]                [numeric](18, 6) NOT NULL,
		[PrezzoTotaleMovFree]          [bit] NOT NULL,
		[PrezzoTotaleMovE]             [numeric](18, 2) NOT NULL,
		[Omaggio]                      [tinyint] NOT NULL,
		[ProvvigioneRiga_1]            [varchar](16) COLLATE Latin1_General_CI_AS NOT NULL,
		[ProvvigioneRiga_2]            [varchar](16) COLLATE Latin1_General_CI_AS NOT NULL,
		[DataConsegna]                 [smalldatetime] NULL,
		[NoteRiga]                     [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Evadibile]                    [bit] NOT NULL,
		[Esecutivo]                    [bit] NOT NULL,
		[Id_DoDb]                      [int] NULL,
		[Reserved_1]                   [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[UserIns]                      [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                      [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                      [smalldatetime] NOT NULL,
		[TimeUpd]                      [smalldatetime] NOT NULL,
		[ts]                           [timestamp] NULL,
		[PackListRef]                  [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CAFormula]                 [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[CAPartenza]                   [smallint] NOT NULL,
		[CADurata]                     [tinyint] NOT NULL,
		[Cd_CAVda]                     [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CACda]                     [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ScontoAddizionale]            [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[FattoreScontoRiga]            [numeric](10, 9) NOT NULL,
		[FattoreScontoAddizionale]     [numeric](10, 9) NOT NULL,
		[FattoreScontoTotale]          [numeric](10, 9) NOT NULL,
		[FattoreProvv_1]               [numeric](10, 9) NOT NULL,
		[FattoreProvv_2]               [numeric](10, 9) NOT NULL,
		[PrezzoResiduoV]               AS (convert(numeric(18,6),round((([PrezzoUnitarioV] * (1 - [FattoreScontoTotale]) + [PrezzoAddizionaleV]) * [QtaEvadibile]),[Decimali]))),
		[PrezzoResiduoE]               AS (convert(numeric(18,2),(([PrezzoUnitarioV] * (1 - [FattoreScontoTotale]) + [PrezzoAddizionaleV]) * [QtaEvadibile] / [Cambio]))),
		[Id_LSArticolo]                [int] NULL,
		[Id_LSScaglione]               [int] NULL,
		[RR_DataInizio]                [smalldatetime] NULL,
		[RR_DataFine]                  [smalldatetime] NULL,
		[RR_Cd_CGConto]                [char](12) COLLATE Latin1_General_CI_AS NULL,
		[TipoPC]                       [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[ExtraInfo]                    [xml] NULL,
		[Matricole]                    [xml](CONTENT [dbo].[Matricole]) NULL,
		[NoteXML]                      [xml](CONTENT [dbo].[NoteXML]) NULL,
		[Evasa]                        [bit] NOT NULL,
		[DataConsegna_R]               AS (isnull([DataConsegna],[DataDoc])),
		[ImportiIvati]                 [bit] NOT NULL,
		[PrezzoTotaleE]                AS (isnull(CONVERT([numeric](18,2),([Qta]*([PrezzoUnitarioV]*((1)-[FattoreScontoTotale])+[PrezzoAddizionaleV]))/[Cambio],(0)),(0))),
		[PrezzoUnitarioScontatoV]      AS (isnull(CONVERT([numeric](18,6),[PrezzoUnitarioV]*((1)-[FattoreScontoTotale]),(0)),(0))),
		[ScontoTotale]                 AS (isnull(case when [ScontoAddizionale]='' then [ScontoRiga] when [ScontoRiga]='' then [ScontoAddizionale] else rtrim([ScontoRiga])+case when ltrim([ScontoAddizionale]) like '-%' then [ScontoAddizionale] else '+'+ltrim([ScontoAddizionale]) end end,'')),
		[ValProvvigione_1]             AS (isnull(round((([Qta]*([PrezzoUnitarioV]*((1)-[FattoreScontoTotale])+[PrezzoAddizionaleV]))*[FattoreProvv_1])/case when [ImportiIvati]=(1) then [Cambio] else (1) end,[Decimali]),(0))),
		[ValProvvigione_2]             AS (isnull(round((([Qta]*([PrezzoUnitarioV]*((1)-[FattoreScontoTotale])+[PrezzoAddizionaleV]))*[FattoreProvv_2])/case when [ImportiIvati]=(1) then [Cambio] else (1) end,[Decimali]),(0))),
		[FTE_Xml]                      [xml] NULL,
		[xPKL_Numerazione]             [int] NOT NULL,
		[xPKL_QtaNumPezzi]             [int] NOT NULL,
		[xPKL_CampoNotePKL]            [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[xPKL_Destinazione]            [varchar](250) COLLATE Latin1_General_CI_AS NULL,
		[xPKL_NotaUtente]              [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[xPKL_PrzLVCAD]                [numeric](18, 6) NULL,
		[xPKL_PrzLVCADP]               [numeric](18, 6) NULL,
		[xPKL_PrzLVEND]                [numeric](18, 6) NULL,
		[xPKL_PrzLVPUBB]               [numeric](18, 6) NULL,
		[xPKL_ValoreBene]              [numeric](18, 6) NULL,
		[xPKL_DirittiAsta]             [numeric](18, 6) NULL,
		[xPKL_FeeDesigner]             [numeric](18, 6) NULL,
		[xPKL_Trasporto]               [numeric](18, 6) NULL,
		[xPKL_Cassa]                   [numeric](18, 6) NULL,
		[xPKL_Restauro]                [numeric](18, 6) NULL,
		[xPKL_Varie]                   [numeric](18, 6) NULL,
		[xPKL_TotaleCosti]             [numeric](18, 6) NULL,
		[xPKL_PackagingDim]            [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[xPKL_NetWeight]               [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[xPKL_GrossWeight]             [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ReverseCharge]             [char](3) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [UK_DORig]
		UNIQUE
		NONCLUSTERED
		([Id_DORig])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [PK_DORig]
	PRIMARY KEY
	CLUSTERED
	([Id_DOTes], [Id_DORig])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_CADurata]
	CHECK
	([CADurata]>=(0) AND [CADurata]<=(240))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900384 | CADurata | [0,240]', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_CADurata'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_CADurata]
GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_DORig_CAFormula]
	CHECK
	([Cd_CAFormula] is null or [Cd_CACda] is null)
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900380', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_CAFormula'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_CAFormula]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cambio]
	CHECK
	([Cambio]>(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900363 | Cambio', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cambio'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cambio]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cd_AR]
	CHECK
	([Cd_AR]=upper([Cd_AR]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900955 | Cd_AR', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cd_AR'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cd_AR]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cd_DOSottoCommessa]
	CHECK
	([Cd_DOSottoCommessa]=upper([Cd_DOSottoCommessa]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900935 | Cd_DOSottoCommessa', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cd_DOSottoCommessa'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cd_DOSottoCommessa]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DoRig_Cd_LS_C]
	CHECK
	([Cd_LS_C] is null)
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DoRig_Cd_LS_C]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cd_MG_A]
	CHECK
	([Cd_MG_A]=upper([Cd_MG_A]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900957 | Cd_MG_A', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cd_MG_A'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cd_MG_A]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cd_MG_P]
	CHECK
	([Cd_MG_P]=upper([Cd_MG_P]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900958 | Cd_MG_P', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cd_MG_P'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cd_MG_P]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cd_MGUbicazione_A]
	CHECK
	([Cd_MGUbicazione_A]=upper([Cd_MGUbicazione_A]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900959 | Cd_MGUbicazione_A', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cd_MGUbicazione_A'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cd_MGUbicazione_A]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Cd_MGUbicazione_P]
	CHECK
	([Cd_MGUbicazione_P]=upper([Cd_MGUbicazione_P]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900959 | Cd_MGUbicazione_P', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Cd_MGUbicazione_P'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Cd_MGUbicazione_P]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Evadibile]
	CHECK
	([Evadibile]=(1))
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Evadibile]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_FattoreProvv_1]
	CHECK
	([FattoreProvv_1]>=(0) AND [FattoreProvv_1]<=(1))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | FattoreProvv_1 | [0,1]', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_FattoreProvv_1'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_FattoreProvv_1]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_FattoreProvv_2]
	CHECK
	([FattoreProvv_2]>=(0) AND [FattoreProvv_2]<=(1))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | FattoreProvv_2 | [0,1]', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_FattoreProvv_2'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_FattoreProvv_2]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_FattoreScontoAddizionale]
	CHECK
	([FattoreScontoAddizionale]>=(-1) AND [FattoreScontoAddizionale]<=(1))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | FattoreScontoAddizionale | [-1,1]', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_FattoreScontoAddizionale'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_FattoreScontoAddizionale]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_FattoreScontoRiga]
	CHECK
	([FattoreScontoRiga]>=(-2) AND [FattoreScontoRiga]<=(1))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | FattoreScontoRiga | [-2,1]', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_FattoreScontoRiga'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_FattoreScontoRiga]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DoRig_Id_DoDB_TipoPC]
	CHECK
	([Id_DoDB] IS NULL OR [TipoPC]=' ')
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DoRig_Id_DoDB_TipoPC]
GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_DORig_MG_MGUbicazione_A]
	CHECK
	([Cd_MGUbicazione_A] is null or [Cd_MG_A] is not null)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'908049', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_MG_MGUbicazione_A'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_MG_MGUbicazione_A]
GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_DORig_MG_MGUbicazione_P]
	CHECK
	([Cd_MGUbicazione_P] is null or [Cd_MG_P] is not null)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'908049', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_MG_MGUbicazione_P'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_MG_MGUbicazione_P]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Omaggio]
	CHECK
	([Omaggio]>=(1) AND [Omaggio]<=(3))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | Omaggio | [1,3]', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Omaggio'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Omaggio]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_ProvvigioneRiga_1]
	CHECK
	([dbo].[afn_PercStrValid]([ProvvigioneRiga_1])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | ProvvigioneRiga_1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_ProvvigioneRiga_1'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_ProvvigioneRiga_1]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_ProvvigioneRiga_2]
	CHECK
	([dbo].[afn_PercStrValid]([ProvvigioneRiga_2])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | ProvvigioneRiga_2', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_ProvvigioneRiga_2'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_ProvvigioneRiga_2]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_QtaEvadibile]
	CHECK
	(abs(isnull([QtaEvadibile],(0)))<=abs([Qta]) AND (sign(isnull([QtaEvadibile],(0)))=(0) OR sign(isnull([QtaEvadibile],(0)))=sign([Qta])))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900386 | QtaEvadibile | Qta', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_QtaEvadibile'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_QtaEvadibile]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_Riga]
	CHECK
	([Riga]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900361 | Riga', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_Riga'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_Riga]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_RigaNonVuota]
	CHECK
	([Cd_AR] IS NOT NULL OR isnull([Descrizione],'')<>'')
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900376', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_RigaNonVuota'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_RigaNonVuota]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DoRig_RR_Data]
	CHECK
	([RR_DataInizio] IS NULL AND [RR_DataFine] IS NULL OR [RR_DataInizio] IS NOT NULL AND [RR_DataFine] IS NOT NULL AND [RR_DataInizio]<=[RR_DataFine])
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900389', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DoRig_RR_Data'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DoRig_RR_Data]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_ScontoAddizionale]
	CHECK
	([dbo].[afn_PercStrValid]([ScontoAddizionale])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | ScontoAddizionale', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_ScontoAddizionale'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_ScontoAddizionale]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_ScontoRiga]
	CHECK
	([dbo].[afn_PercStrValid]([ScontoRiga])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | ScontoRiga', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_ScontoRiga'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_ScontoRiga]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DoRig_TipoPC]
	CHECK
	([TipoPC]=' ' OR [TipoPC]='P' OR [TipoPC]='C')
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900372 | TipoPC | ('' '',P,C)', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DoRig_TipoPC'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DoRig_TipoPC]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [CK_DORig_TipoRigaRif]
	CHECK
	([TipoRigaRif]=' ' OR ([TipoRigaRif]='R' OR [TipoRigaRif]='r'))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900372 |TipoRigaRif | ('' '',R,r)', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'CONSTRAINT', N'CK_DORig_TipoRigaRif'
GO
ALTER TABLE [dbo].[DORig]
CHECK CONSTRAINT [CK_DORig_TipoRigaRif]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_CADurata]
	DEFAULT ((1)) FOR [CADurata]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Cambio]
	DEFAULT ((1)) FOR [Cambio]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_CAPartenza]
	DEFAULT ((0)) FOR [CAPartenza]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Contabile]
	DEFAULT ((0)) FOR [Contabile]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Decimali]
	DEFAULT ((2)) FOR [Decimali]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_DecimaliPrzUn]
	DEFAULT ((2)) FOR [DecimaliPrzUn]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_Esecutivo]
	DEFAULT ((0)) FOR [Esecutivo]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Evadibile]
	DEFAULT ((1)) FOR [Evadibile]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_Evasa]
	DEFAULT ((0)) FOR [Evasa]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_FattoreProvv_1]
	DEFAULT ((0)) FOR [FattoreProvv_1]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_FattoreProvv_2]
	DEFAULT ((0)) FOR [FattoreProvv_2]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_FattoreScontoAddizionale]
	DEFAULT ((0)) FOR [FattoreScontoAddizionale]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_FattoreScontoRiga]
	DEFAULT ((0)) FOR [FattoreScontoRiga]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_FattoreScontoTotale]
	DEFAULT ((0)) FOR [FattoreScontoTotale]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_FattoreToUM1]
	DEFAULT ((1)) FOR [FattoreToUM1]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_ImportiIvati]
	DEFAULT ((0)) FOR [ImportiIvati]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Omaggio]
	DEFAULT ((1)) FOR [Omaggio]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_PrezzoAddizionaleV]
	DEFAULT ((0)) FOR [PrezzoAddizionaleV]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_PrezzoTotaleMovE]
	DEFAULT ((0)) FOR [PrezzoTotaleMovE]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_PrezzoTotaleMovFree]
	DEFAULT ((0)) FOR [PrezzoTotaleMovFree]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_PrezzoTotaleV]
	DEFAULT ((0)) FOR [PrezzoTotaleV]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_PrezzoUnitarioV]
	DEFAULT ((0)) FOR [PrezzoUnitarioV]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_ProvvigioneRiga_1]
	DEFAULT ('') FOR [ProvvigioneRiga_1]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_ProvvigioneRiga_2]
	DEFAULT ('') FOR [ProvvigioneRiga_2]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Qta]
	DEFAULT ((0)) FOR [Qta]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_QtaEvasa]
	DEFAULT ((0)) FOR [QtaEvasa]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Reserved_1]
	DEFAULT ('0000000000') FOR [Reserved_1]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_Riga]
	DEFAULT ((0)) FOR [Riga]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_ScontoAddizionale]
	DEFAULT ('') FOR [ScontoAddizionale]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_ScontoRiga]
	DEFAULT ('') FOR [ScontoRiga]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DoRig_TipoPC]
	DEFAULT (' ') FOR [TipoPC]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_TipoRigaRif]
	DEFAULT ('') FOR [TipoRigaRif]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_xPKL_Numerazione]
	DEFAULT ((1)) FOR [xPKL_Numerazione]
GO
ALTER TABLE [dbo].[DORig]
	ADD
	CONSTRAINT [DF_DORig_xPKL_QtaNumPezzi]
	DEFAULT ((1)) FOR [xPKL_QtaNumPezzi]
GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_Aliquota]
	FOREIGN KEY ([Cd_Aliquota]) REFERENCES [dbo].[Aliquota] ([Cd_Aliquota])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_Aliquota]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_Aliquota_E]
	FOREIGN KEY ([Cd_Aliquota_E]) REFERENCES [dbo].[Aliquota] ([Cd_Aliquota])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_Aliquota_E]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_Aliquota_R]
	FOREIGN KEY ([Cd_Aliquota_R]) REFERENCES [dbo].[Aliquota] ([Cd_Aliquota])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_Aliquota_R]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_AR]
	FOREIGN KEY ([Cd_AR]) REFERENCES [dbo].[AR] ([Cd_AR])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_AR]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_ARLotto]
	FOREIGN KEY ([Cd_AR], [Cd_ARLotto]) REFERENCES [dbo].[ARLotto] ([Cd_AR], [Cd_ARLotto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_ARLotto]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_ARMisura]
	FOREIGN KEY ([Cd_ARMisura]) REFERENCES [dbo].[ARMisura] ([Cd_ARMisura])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_ARMisura]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_CACda]
	FOREIGN KEY ([Cd_CACda]) REFERENCES [dbo].[CACda] ([Cd_CACda])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_CACda]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_CAFormula]
	FOREIGN KEY ([Cd_CAFormula]) REFERENCES [dbo].[CAFormula] ([Cd_CAFormula])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_CAFormula]

GO
ALTER TABLE [dbo].[DORig]
	WITH CHECK
	ADD CONSTRAINT [FK_DORig_CAVda]
	FOREIGN KEY ([Cd_CAVda]) REFERENCES [dbo].[CAVda] ([Cd_CAVda])
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_CAVda]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_CF]
	FOREIGN KEY ([Cd_CF]) REFERENCES [dbo].[CF] ([Cd_CF])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_CF]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_CGConto]
	FOREIGN KEY ([Cd_CGConto]) REFERENCES [dbo].[CGConto] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_CGConto]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_DO]
	FOREIGN KEY ([Cd_DO]) REFERENCES [dbo].[DO] ([Cd_DO])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_DO]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_DoDB]
	FOREIGN KEY ([Id_DoDb]) REFERENCES [dbo].[DoDB] ([Id_DoDb])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_DoDB]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_DORig]
	FOREIGN KEY ([Id_DORig_Evade]) REFERENCES [dbo].[DORig] ([Id_DORig])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_DORig]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_DOSottoCommessa]
	FOREIGN KEY ([Cd_DOSottoCommessa]) REFERENCES [dbo].[DOSottoCommessa] ([Cd_DOSottoCommessa])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_DOSottoCommessa]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_DOTes]
	FOREIGN KEY ([Id_DOTes]) REFERENCES [dbo].[DOTes] ([Id_DOTes])
	ON DELETE CASCADE
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_DOTes]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_LS_C]
	FOREIGN KEY ([Cd_LS_C]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_LS_C]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_LSArticolo]
	FOREIGN KEY ([Id_LSArticolo]) REFERENCES [dbo].[LSArticolo] ([Id_LSArticolo])
ALTER TABLE [dbo].[DORig]
	NOCHECK CONSTRAINT [FK_DORig_LSArticolo]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_LSScaglione]
	FOREIGN KEY ([Id_LSScaglione]) REFERENCES [dbo].[LSScaglione] ([Id_LSScaglione])
ALTER TABLE [dbo].[DORig]
	NOCHECK CONSTRAINT [FK_DORig_LSScaglione]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_MG_A]
	FOREIGN KEY ([Cd_MG_A]) REFERENCES [dbo].[MG] ([Cd_MG])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_MG_A]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_MG_P]
	FOREIGN KEY ([Cd_MG_P]) REFERENCES [dbo].[MG] ([Cd_MG])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_MG_P]

GO
ALTER TABLE [dbo].[DORig]
	WITH CHECK
	ADD CONSTRAINT [FK_DORig_MGCausale]
	FOREIGN KEY ([Cd_MGCausale]) REFERENCES [dbo].[MGCausale] ([Cd_MGCausale])
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_MGCausale]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_MGEsercizio]
	FOREIGN KEY ([Cd_MGEsercizio]) REFERENCES [dbo].[MGEsercizio] ([Cd_MGEsercizio])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_MGEsercizio]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_MGUbicazione_A]
	FOREIGN KEY ([Cd_MG_A], [Cd_MGUbicazione_A]) REFERENCES [dbo].[MGUbicazione] ([Cd_MG], [Cd_MGUbicazione])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_MGUbicazione_A]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_MGUbicazione_P]
	FOREIGN KEY ([Cd_MG_P], [Cd_MGUbicazione_P]) REFERENCES [dbo].[MGUbicazione] ([Cd_MG], [Cd_MGUbicazione])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_MGUbicazione_P]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DoRig_ReverseCharge]
	FOREIGN KEY ([Cd_ReverseCharge]) REFERENCES [dbo].[ReverseCharge] ([Cd_ReverseCharge])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DoRig_ReverseCharge]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DoRig_RR_Cd_CGConto]
	FOREIGN KEY ([RR_Cd_CGConto]) REFERENCES [dbo].[CGConto] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DoRig_RR_Cd_CGConto]

GO
ALTER TABLE [dbo].[DORig]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DORig_VL]
	FOREIGN KEY ([Cd_VL]) REFERENCES [dbo].[VL] ([Cd_VL])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DORig]
	CHECK CONSTRAINT [FK_DORig_VL]

GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_Aliquota]
	ON [dbo].[DORig] ([Cd_Aliquota])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_Aliquota_E]
	ON [dbo].[DORig] ([Cd_Aliquota_E])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_Aliquota_R]
	ON [dbo].[DORig] ([Cd_Aliquota_R])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_AR]
	ON [dbo].[DORig] ([Cd_AR], [DataDoc])
	INCLUDE ([Cd_CF])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_AR_Cd_ARLotto]
	ON [dbo].[DORig] ([Cd_AR], [Cd_ARLotto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_ARLotto]
	ON [dbo].[DORig] ([Cd_ARLotto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_ARMisura]
	ON [dbo].[DORig] ([Cd_ARMisura])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DoRig_Cd_CACda]
	ON [dbo].[DORig] ([Cd_CACda])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DoRig_Cd_CAFormula]
	ON [dbo].[DORig] ([Cd_CAFormula])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DoRig_Cd_CAVda]
	ON [dbo].[DORig] ([Cd_CAVda])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_CF]
	ON [dbo].[DORig] ([Cd_CF], [TipoDocumento])
	INCLUDE ([Cd_DO], [Evasa])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_CGConto]
	ON [dbo].[DORig] ([Cd_CGConto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_DO]
	ON [dbo].[DORig] ([Cd_DO], [TipoDocumento])
	INCLUDE ([Cd_CF], [Evasa])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_DOSottoCommessa]
	ON [dbo].[DORig] ([Cd_DOSottoCommessa])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_LS_C]
	ON [dbo].[DORig] ([Cd_LS_C])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_MG_A_Cd_MGUbicazione_A]
	ON [dbo].[DORig] ([Cd_MG_A], [Cd_MGUbicazione_A])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_MG_P_Cd_MGUbicazione_P]
	ON [dbo].[DORig] ([Cd_MG_P], [Cd_MGUbicazione_P])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_MGCausale]
	ON [dbo].[DORig] ([Cd_MGCausale])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_MGEsercizio]
	ON [dbo].[DORig] ([Cd_MGEsercizio])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_MGUbicazione_A]
	ON [dbo].[DORig] ([Cd_MGUbicazione_A])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_MGUbicazione_P]
	ON [dbo].[DORig] ([Cd_MGUbicazione_P])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_ReverseCharge]
	ON [dbo].[DORig] ([Cd_ReverseCharge])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Cd_VL]
	ON [dbo].[DORig] ([Cd_VL])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Id_DoDB]
	ON [dbo].[DORig] ([Id_DoDb])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Id_DORig_Evade]
	ON [dbo].[DORig] ([Id_DORig_Evade])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Id_LSArticolo]
	ON [dbo].[DORig] ([Id_LSArticolo])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_Id_LSScaglione]
	ON [dbo].[DORig] ([Id_LSScaglione])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DORig_RR_Cd_CGConto]
	ON [dbo].[DORig] ([RR_Cd_CGConto])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cambio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Valore del cambio.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cambio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice aliquota IVA.
Obbligatorio per righe in cui PrezzoTotaleV != 0', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_Aliquota'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_Aliquota_E'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Eventuale codice di esenzione riportato dalla testa.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_Aliquota_E'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_Aliquota_R'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice aliquota effettivo utilizzato per il calcolo dell''imposta sulle righe.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_Aliquota_R'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Articolo
NULL se riga descrittiva
', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_AR'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del lotto', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_ARLotto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice unità di misura.
Obbligatorio se viene Qta != 0', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_ARMisura'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_CF'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Cliente/Fornitore
', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_CF'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_DO'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice della Commessa', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_DOSottoCommessa'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_LS_C'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice listino per i componenti: replicato dalla testa documento per velocizzare le movimentazioni di magazzino implicite.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_LS_C'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del Magazzino di Arrivo.
Obbligatorio se MagAFlag = 1.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_MG_A'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del Magazzino di partenza.
Obbligatorio se MagPFlag = 1.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_MG_P'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_MGEsercizio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice esercizio di magazzino.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_MGEsercizio'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_VL'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Valuta.
', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Cd_VL'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Contabile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data di Consegna
ABL Default: DoTes.DataConsegna.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'DataConsegna'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'DataDoc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Documento', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'DataDoc'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Decimali'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Decimali della valuta
', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Decimali'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'DecimaliPrzUn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Decimali per i prezzi unitari
', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'DecimaliPrzUn'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizione della riga di documento: può essere la descizione dell''articolo o una riga inserita manualmente.
ABL Default: AR.Descrizione', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Descrizione'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Esecutivo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag che indica l''evadibilità della riga. ', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Evadibile'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Evasa'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Vale 1 (true) quando la riga è (completamente) evasa.
Come fosse una colonna calcolata:
	Case QtaEvadibile When 0 Then 1 Else 0 End
Non è stata creata come colonna calcolata vera e proprio xché se inclusa nell''indice poi non viene utilizzata.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Evasa'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreProvv_1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fattore relativo alla provvigione 1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreProvv_1'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreProvv_2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fattore relativo alla provvigione 2', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreProvv_2'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreScontoAddizionale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fattore di sconto addizionale della riga', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreScontoAddizionale'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreScontoRiga'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fattore di sconto della riga', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreScontoRiga'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreScontoTotale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fattore di conversione all''unità di misura principale
ABL:
Se Cd_ARMisura NULL viene messo a 1 in automatico.
Se Cd_ARMisura NOT NULL e FattoreToUM1 non specificato e Cd_ARMisura è tra le unità di misura dell''Articolo (nella tavola ARARMisura) allora', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'FattoreToUM1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ID Univoco.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Id_DORig'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Id della riga che viene evasa da questa riga per una quantità pari a QtaEvasa.
Se NOT NULL allora QtaEvase deve essere != 0 (table constraint).', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Id_DORig_Evade'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ID di collegamento alla testa del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Id_DOTes'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Collegamento con LSArticolo. La FK è disabilitata.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Id_LSArticolo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Collegamento con LSScaglione. La FK è disabilitata.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Id_LSScaglione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Note sulla riga del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'NoteRiga'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'NumeroDoc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero documento.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'NumeroDoc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipo di omaggio sulla riga:
   1 - Nessuno
   2 - Imponibile
   3 - Imponibile + IVA', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Omaggio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice x il Packing List', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PackListRef'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Prezzo addizionale che va ad influire sul totale di riga.
ABL: TotaleRiga = Qta * (PrezzoUnitarioScontatoV + PrezzoAddizionale)', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PrezzoAddizionaleV'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Prezzo totale di riga per la valorizzazione  di magazzino a cui imputare eventuali costi aggiuntivi.
N.B.: Questo campo riporta il valore del movimento di magazzino in Euro.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PrezzoTotaleMovE'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag per determinare se il valore del movimento di magazzino deve essere uguale a PrezzoTotaleV o se è di libera gestione.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PrezzoTotaleMovFree'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PrezzoTotaleV'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Valore (Prezzo/Costo) totale di riga (in Valuta)', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PrezzoTotaleV'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Prezzo unitario in Valuta.
Viene gestito un valore di default dal codice inline before loop: viene cercata la voce nel listino opportuno...', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'PrezzoUnitarioV'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Percentuale composta di provviogine di riga 1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'ProvvigioneRiga_1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Percentuale composta di provvigione di riga 2', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'ProvvigioneRiga_2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Quantità movimentata.
Espressa nell unità di misura Cd_ARMisura della riga corrente con fattore di conversione FattoreToUM1 per riportarla all''unità di misura principale.
In caso di modifica della quantità, se la QtaEvadibile non viene modificata bisog', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Qta'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Quantità Evadibile
Espressa in unità di misura Cd_ARMisura della riga corrente con fattore di conversione FattoreToUM1 per riportarla all''unità di misura principale.
Validazioni: La quantità evadibile non deve essere superiore alla Qta (salvo per righe', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'QtaEvadibile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Quantità da evadere su un altra riga (se Id_DORig_Evade NOT NULL)
Espressa in unità di misura Cd_ARMisura della riga evasa, non della riga corrente.
Se != 0 allora Id_DORig_Evade non può essere NULL (vedere table constraint)', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'QtaEvasa'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero progressivo della riga.', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'Riga'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sconto addizionale di riga', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'ScontoAddizionale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sconto della riga
Viene gestito un valore di default dal codice inline', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'ScontoRiga'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'TipoDocumento'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipo documento', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'TipoDocumento'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipo Riga descrittiva :
''''  = Riga normale (con o senza codice articolo), ogni altra cosa denota righe descrittive.
R = Riga di riferimento da prelievo
r  = Riga di riferimento prelevata', 'SCHEMA', N'dbo', 'TABLE', N'DORig', 'COLUMN', N'TipoRigaRif'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900532', 'SCHEMA', N'dbo', 'TABLE', N'DORig', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Righe documenti', 'SCHEMA', N'dbo', 'TABLE', N'DORig', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[DORig]
	TO [public]
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [MX_DORig_Matricole]
	ON [dbo].[DORig] ([Matricole])
GO
SET ANSI_PADDING ON
GO
CREATE XML INDEX [MX_DORig_Matricole_Value]
	ON [dbo].[DORig] ([Matricole])
	USING XML INDEX [MX_DORig_Matricole]
	FOR VALUE
GO
ALTER TABLE [dbo].[DORig] SET (LOCK_ESCALATION = TABLE)
GO
