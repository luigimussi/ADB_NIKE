SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOTes] (
		[Id_DOTes]                       [int] IDENTITY(1, 1) NOT NULL,
		[Cd_CF]                          [char](7) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_Aliquota_E]                  [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CFDest]                      [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CFSede]                      [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DO]                          [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[CliFor]                         [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_CN]                          [char](3) COLLATE Latin1_General_CI_AS NULL,
		[TipoDocumento]                  [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[Contabile]                      [bit] NOT NULL,
		[NumeroDoc]                      [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[DataDoc]                        [smalldatetime] NOT NULL,
		[Cd_MGEsercizio]                 [char](4) COLLATE Latin1_General_CI_AS NULL,
		[EsAnno]                         [char](4) COLLATE Latin1_General_CI_AS NULL,
		[NumeroDocRif]                   [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[DataDocRif]                     [smalldatetime] NULL,
		[DataConsegna]                   [smalldatetime] NULL,
		[Cd_VL]                          [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Decimali]                       [tinyint] NOT NULL,
		[DecimaliPrzUn]                  [tinyint] NOT NULL,
		[Cambio]                         [numeric](18, 6) NOT NULL,
		[Cd_MGCausale]                   [char](3) COLLATE Latin1_General_CI_AS NULL,
		[MagPFlag]                       [bit] NOT NULL,
		[MagAFlag]                       [bit] NOT NULL,
		[Cd_LS_1]                        [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_LS_2]                        [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_LS_C]                        [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_PG]                          [char](4) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Agente_1]                    [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Agente_2]                    [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CFZona]                      [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGConto_Banca]               [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOSottoCommessa]             [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[ScontoCassa]                    [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_DOTrasporto]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOSped]                      [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOPorto]                     [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOAspBene]                   [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOVettore_1]                 [char](2) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOVettore_2]                 [char](2) COLLATE Latin1_General_CI_AS NULL,
		[Vettore1DataOra]                [smalldatetime] NULL,
		[Vettore2DataOra]                [smalldatetime] NULL,
		[TrasportoDataora]               [smalldatetime] NULL,
		[Colli]                          [int] NOT NULL,
		[PesoLordo]                      [numeric](18, 8) NOT NULL,
		[PesoNetto]                      [numeric](18, 8) NOT NULL,
		[VolumeTotale]                   [numeric](18, 8) NOT NULL,
		[NotePiede]                      [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[AbbuonoV]                       [numeric](18, 6) NOT NULL,
		[RigheMerce]                     [smallint] NOT NULL,
		[RigheMerceEvadibili]            [smallint] NOT NULL,
		[RigheSpesa]                     [smallint] NOT NULL,
		[RigheSpesaEvadibili]            [smallint] NOT NULL,
		[AccontoPerc]                    [numeric](18, 2) NOT NULL,
		[AccontoFissoV]                  [numeric](18, 6) NOT NULL,
		[AccontoV]                       [numeric](18, 6) NOT NULL,
		[Esecutivo]                      [bit] NOT NULL,
		[Reserved_1]                     [varchar](10) COLLATE Latin1_General_CI_AS NULL,
		[UserIns]                        [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                        [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                        [smalldatetime] NOT NULL,
		[TimeUpd]                        [smalldatetime] NOT NULL,
		[ts]                             [timestamp] NULL,
		[Prelevabile]                    [bit] NOT NULL,
		[Modificabile]                   [bit] NOT NULL,
		[Cd_CF_Fatt]                     [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Iban]                           [varchar](34) COLLATE Latin1_General_CI_AS NULL,
		[BicCode]                        [char](11) COLLATE Latin1_General_CI_AS NULL,
		[DoBitMask]                      [int] NOT NULL,
		[RigheEvadibili]                 AS ([RigheMerceEvadibili]),
		[DataPag]                        [smalldatetime] NULL,
		[TipoFattura]                    [tinyint] NOT NULL,
		[NoteXML]                        [xml](CONTENT [dbo].[NoteXML]) NULL,
		[Cd_CF_Fatt_R]                   AS (isnull(isnull([Cd_CF_Fatt],[Cd_CF]),'')),
		[Cd_Abicab]                      AS (isnull(case when left([Iban],(2))='IT' OR left([Iban],(2))='SM' then substring([Iban],(6),(10)) else '' end,'')),
		[Righe]                          AS (isnull([RigheMerce]+[RigheSpesa],(0))),
		[NumeroDocI]                     AS (isnull(CONVERT([int],left([NumeroDoc],(6)),0),(0))),
		[Ue]                             AS (isnull(CONVERT([bit],case when [Tipofattura]=(1) then (1) else (0) end,0),(0))),
		[IvaSospesa]                     [bit] NOT NULL,
		[Cd_DoCaricatore]                [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DoCommittente]               [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DoProprietarioMerce]         [char](3) COLLATE Latin1_General_CI_AS NULL,
		[SdTAltro]                       [xml] NULL,
		[Cd_DoLuogoCarico]               [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DoLuogoScarico]              [char](3) COLLATE Latin1_General_CI_AS NULL,
		[SegnoDocumento]                 AS (isnull(CONVERT([smallint],case when [TipoDocumento]='M' OR [TipoDocumento]='N' then (-1) else (1) end,(0)),(1))),
		[CGCorrispondenzaIvaMerce]       [bit] NOT NULL,
		[ImportiIvati]                   [bit] NOT NULL,
		[ModificabilePdf]                [bit] NOT NULL,
		[FTE_Status]                     [char](3) COLLATE Latin1_General_CI_AS NULL,
		[FTE_Xml]                        [xml] NULL,
		[IvaSplit]                       [bit] NOT NULL,
		[Cd_ReverseCharge]               [char](3) COLLATE Latin1_General_CI_AS NULL,
		[xCd_CF_CA]                      [char](3) COLLATE Latin1_General_CI_AS NULL,
		[xDesc_CA]                       [varchar](80) COLLATE Latin1_General_CI_AS NULL,
		[xPKL_Code_Show]                 [bit] NOT NULL,
		[xPKL_Numerazione_Show]          [bit] NOT NULL,
		[xPKL_QtaNumPezzi_Show]          [bit] NOT NULL,
		[xPKL_Immagine_Show]             [bit] NOT NULL,
		[xPKL_CampoNotePKL_Show]         [bit] NOT NULL,
		[xPKL_Cd_MG_P_Show]              [bit] NOT NULL,
		[xPKL_Destinazione_Show]         [bit] NOT NULL,
		[xPKL_NotaUtente_Show]           [bit] NOT NULL,
		[xPKL_PrzLVCAD_Show]             [bit] NOT NULL,
		[xPKL_PrzLVCADP_Show]            [bit] NOT NULL,
		[xPKL_PrzLVEND_Show]             [bit] NOT NULL,
		[xPKL_PrzLVPUBB_Show]            [bit] NOT NULL,
		[xPKL_ValoreBene_Show]           [bit] NOT NULL,
		[xPKL_DirittiAsta_Show]          [bit] NOT NULL,
		[xPKL_FeeDesigner_Show]          [bit] NOT NULL,
		[xPKL_Trasporto_Show]            [bit] NOT NULL,
		[xPKL_Cassa_Show]                [bit] NOT NULL,
		[xPKL_Restauro_Show]             [bit] NOT NULL,
		[xPKL_Varie_Show]                [bit] NOT NULL,
		[xPKL_TotaleCosti_Show]          [bit] NOT NULL,
		[xPKL_PakagingDim_Show]          [bit] NOT NULL,
		[xPKL_NetWeight_Show]            [bit] NOT NULL,
		[xPKL_GrossWeight_Show]          [bit] NOT NULL,
		[xPKL_Code_Position]             [tinyint] NOT NULL,
		[xPKL_Numerazione_Position]      [tinyint] NOT NULL,
		[xPKL_QtaNumPezzi_Position]      [tinyint] NOT NULL,
		[xPKL_Immagine_Position]         [tinyint] NOT NULL,
		[xPKL_CampoNotePKL_Position]     [tinyint] NOT NULL,
		[xPKL_Cd_MG_P_Position]          [tinyint] NOT NULL,
		[xPKL_Destinazione_Position]     [tinyint] NOT NULL,
		[xPKL_NotaUtente_Position]       [tinyint] NOT NULL,
		[xPKL_PrzLVCAD_Position]         [tinyint] NOT NULL,
		[xPKL_PrzLVCADP_Position]        [tinyint] NOT NULL,
		[xPKL_PrzLVEND_Position]         [tinyint] NOT NULL,
		[xPKL_PrzLVPUBB_Position]        [tinyint] NOT NULL,
		[xPKL_ValoreBene_Position]       [tinyint] NOT NULL,
		[xPKL_DirittiAsta_Position]      [tinyint] NOT NULL,
		[xPKL_FeeDesigner_Position]      [tinyint] NOT NULL,
		[xPKL_Trasporto_Position]        [tinyint] NOT NULL,
		[xPKL_Cassa_Position]            [tinyint] NOT NULL,
		[xPKL_Restauro_Position]         [tinyint] NOT NULL,
		[xPKL_Varie_Position]            [tinyint] NOT NULL,
		[xPKL_TotaleCosti_Position]      [tinyint] NOT NULL,
		[xPKL_PakagingDim_Position]      [tinyint] NOT NULL,
		[xPKL_NetWeight_Position]        [tinyint] NOT NULL,
		[xPKL_GrossWeight_Position]      [tinyint] NOT NULL,
		[xPKL_Titolo]                    [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
		[xPKL_Descrizione]               [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
		[xPKL_PackagingDim_Show]         [bit] NOT NULL,
		[xPKL_PackagingDim_Position]     [tinyint] NOT NULL,
		CONSTRAINT [UK_DOTes]
		UNIQUE
		NONCLUSTERED
		([Cd_CN], [EsAnno], [NumeroDoc])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [PK_DOTes]
	PRIMARY KEY
	CLUSTERED
	([Id_DOTes])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_AccontoPerc]
	CHECK
	([AccontoPerc]>=(0) AND [AccontoPerc]<=(100))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | AccontoPerc | [0,100]', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'CONSTRAINT', N'CK_DOTes_AccontoPerc'
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_AccontoPerc]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_Cambio]
	CHECK
	([Cambio]>(0))
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_Cambio]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_Cd_DoSottoCommessa]
	CHECK
	([Cd_DoSottoCommessa]=upper([Cd_DoSottoCommessa]) collate Latin1_General_CS_AS)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900935 | Cd_DoSottoCommessa', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'CONSTRAINT', N'CK_DOTes_Cd_DoSottoCommessa'
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_Cd_DoSottoCommessa]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_Cd_LS_2]
	CHECK
	(NOT ([Cd_LS_2]='UACQ_F' OR [Cd_LS_2]='UACQ' OR [Cd_LS_2]='UVEN_C' OR [Cd_LS_2]='UVEN'))
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_Cd_LS_2]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DoTes_Cd_LS_C]
	CHECK
	([Cd_LS_C] is null)
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DoTes_Cd_LS_C]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_DataDocRif]
	CHECK
	(NOT ([DataDocRif] IS NULL AND [Contabile]=(1) AND [CliFor]='F'))
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_DataDocRif]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DoTes_DataPag]
	CHECK
	([DataPag] IS NULL OR [DataPag]>[DataDoc])
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900403 | DataDoc | DataPag', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'CONSTRAINT', N'CK_DoTes_DataPag'
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DoTes_DataPag]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_IvaSplit_IvaSospesa]
	CHECK
	(NOT ([IvaSplit]=(1) AND [IvaSospesa]=(1)))
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_IvaSplit_IvaSospesa]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_NumeroDocRif]
	CHECK
	(NOT (isnull([NumeroDocRif],'')='' AND [Contabile]=(1) AND [CliFor]='F'))
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_NumeroDocRif]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [CK_DOTes_ScontoCassa]
	CHECK
	([dbo].[afn_PercStrValid]([ScontoCassa])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | ScontoCassa', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'CONSTRAINT', N'CK_DOTes_ScontoCassa'
GO
ALTER TABLE [dbo].[DOTes]
CHECK CONSTRAINT [CK_DOTes_ScontoCassa]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_AbbuonoV]
	DEFAULT ((0)) FOR [AbbuonoV]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_AccontoFissoV]
	DEFAULT ((0)) FOR [AccontoFissoV]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_AccontoPerc]
	DEFAULT ((0)) FOR [AccontoPerc]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_AccontoV]
	DEFAULT ((0)) FOR [AccontoV]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Cambio]
	DEFAULT ((1)) FOR [Cambio]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_CGCorrispondenzaIvaMerce]
	DEFAULT ((0)) FOR [CGCorrispondenzaIvaMerce]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_Clifor]
	DEFAULT ('C') FOR [CliFor]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Colli]
	DEFAULT ((0)) FOR [Colli]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Contabile]
	DEFAULT ((0)) FOR [Contabile]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_DataDoc]
	DEFAULT (getdate()) FOR [DataDoc]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Decimali]
	DEFAULT ((2)) FOR [Decimali]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_DecimaliPrzUn]
	DEFAULT ((2)) FOR [DecimaliPrzUn]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_DoBitMask]
	DEFAULT (0x7FFFFFFF) FOR [DoBitMask]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Esecutivo]
	DEFAULT ((1)) FOR [Esecutivo]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_ImportiIvati]
	DEFAULT ((0)) FOR [ImportiIvati]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_IvaSospesa]
	DEFAULT ((0)) FOR [IvaSospesa]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_IvaSplit]
	DEFAULT ((0)) FOR [IvaSplit]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_MagAFlag]
	DEFAULT ((0)) FOR [MagAFlag]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_MagPFlag]
	DEFAULT ((0)) FOR [MagPFlag]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_Modificabile]
	DEFAULT ((1)) FOR [Modificabile]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_ModificabilePdf]
	DEFAULT ((1)) FOR [ModificabilePdf]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_PesoLordo]
	DEFAULT ((0)) FOR [PesoLordo]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_PesoNetto]
	DEFAULT ((0)) FOR [PesoNetto]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_Prelevabile]
	DEFAULT ((1)) FOR [Prelevabile]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Reserved_1]
	DEFAULT ('0000000000') FOR [Reserved_1]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_RigheMerce]
	DEFAULT ((0)) FOR [RigheMerce]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_RigheMerceEvadibili]
	DEFAULT ((0)) FOR [RigheMerceEvadibili]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_RigheSpesa]
	DEFAULT ((0)) FOR [RigheSpesa]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_RigheSpesaEvadibili]
	DEFAULT ((0)) FOR [RigheSpesaEvadibili]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_ScontoCassa]
	DEFAULT ('') FOR [ScontoCassa]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DoTes_TipoDocumento]
	DEFAULT ('G') FOR [TipoDocumento]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_Tipofattura]
	DEFAULT ((0)) FOR [TipoFattura]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_VolumeTotale]
	DEFAULT ((0)) FOR [VolumeTotale]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_CampoNotePKL_Position]
	DEFAULT ((0)) FOR [xPKL_CampoNotePKL_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_CampoNotePKL_Show]
	DEFAULT ((0)) FOR [xPKL_CampoNotePKL_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Cassa_Position]
	DEFAULT ((0)) FOR [xPKL_Cassa_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Cassa_Show]
	DEFAULT ((0)) FOR [xPKL_Cassa_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Cd_MG_P_Position]
	DEFAULT ((0)) FOR [xPKL_Cd_MG_P_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Cd_MG_P_Show]
	DEFAULT ((0)) FOR [xPKL_Cd_MG_P_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Code_Position]
	DEFAULT ((0)) FOR [xPKL_Code_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Code_Show]
	DEFAULT ((1)) FOR [xPKL_Code_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Descrizione]
	DEFAULT ('') FOR [xPKL_Descrizione]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Destinazione_Position]
	DEFAULT ((0)) FOR [xPKL_Destinazione_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Destinazione_Show]
	DEFAULT ((0)) FOR [xPKL_Destinazione_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_DirittiAsta_Position]
	DEFAULT ((0)) FOR [xPKL_DirittiAsta_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_DirittiAsta_Show]
	DEFAULT ((0)) FOR [xPKL_DirittiAsta_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_FeeDesigner_Position]
	DEFAULT ((0)) FOR [xPKL_FeeDesigner_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_FeeDesigner_Show]
	DEFAULT ((0)) FOR [xPKL_FeeDesigner_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_GrossWeight_Position]
	DEFAULT ((0)) FOR [xPKL_GrossWeight_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_GrossWeight_Show]
	DEFAULT ((0)) FOR [xPKL_GrossWeight_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Immagine_Position]
	DEFAULT ((0)) FOR [xPKL_Immagine_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Immagine_Show]
	DEFAULT ((0)) FOR [xPKL_Immagine_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_NetWeight_Position]
	DEFAULT ((0)) FOR [xPKL_NetWeight_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_NetWeight_Show]
	DEFAULT ((0)) FOR [xPKL_NetWeight_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_NotaUtente_Position]
	DEFAULT ((0)) FOR [xPKL_NotaUtente_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_NotaUtente_Show]
	DEFAULT ((0)) FOR [xPKL_NotaUtente_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Numerazione_Position]
	DEFAULT ((0)) FOR [xPKL_Numerazione_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Numerazione_Show]
	DEFAULT ((0)) FOR [xPKL_Numerazione_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PackagingDim_Position]
	DEFAULT ((0)) FOR [xPKL_PackagingDim_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PackagingDim_Show]
	DEFAULT ((0)) FOR [xPKL_PackagingDim_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PakagingDim_Position]
	DEFAULT ((0)) FOR [xPKL_PakagingDim_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PakagingDim_Show]
	DEFAULT ((0)) FOR [xPKL_PakagingDim_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVCAD_Position]
	DEFAULT ((0)) FOR [xPKL_PrzLVCAD_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVCAD_Show]
	DEFAULT ((0)) FOR [xPKL_PrzLVCAD_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVCADP_Position]
	DEFAULT ((0)) FOR [xPKL_PrzLVCADP_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVCADP_Show]
	DEFAULT ((0)) FOR [xPKL_PrzLVCADP_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVEND_Position]
	DEFAULT ((0)) FOR [xPKL_PrzLVEND_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVEND_Show]
	DEFAULT ((0)) FOR [xPKL_PrzLVEND_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVPUBB_Position]
	DEFAULT ((0)) FOR [xPKL_PrzLVPUBB_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_PrzLVPUBB_Show]
	DEFAULT ((0)) FOR [xPKL_PrzLVPUBB_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_QtaNumPezzi_Position]
	DEFAULT ((0)) FOR [xPKL_QtaNumPezzi_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_QtaNumPezzi_Show]
	DEFAULT ((0)) FOR [xPKL_QtaNumPezzi_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Restauro_Position]
	DEFAULT ((0)) FOR [xPKL_Restauro_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Restauro_Show]
	DEFAULT ((0)) FOR [xPKL_Restauro_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Titolo]
	DEFAULT ('') FOR [xPKL_Titolo]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_TotaleCosti_Position]
	DEFAULT ((0)) FOR [xPKL_TotaleCosti_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_TotaleCosti_Show]
	DEFAULT ((0)) FOR [xPKL_TotaleCosti_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Trasporto_Position]
	DEFAULT ((0)) FOR [xPKL_Trasporto_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Trasporto_Show]
	DEFAULT ((0)) FOR [xPKL_Trasporto_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_ValoreBene_Position]
	DEFAULT ((0)) FOR [xPKL_ValoreBene_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_ValoreBene_Show]
	DEFAULT ((0)) FOR [xPKL_ValoreBene_Show]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Varie_Position]
	DEFAULT ((0)) FOR [xPKL_Varie_Position]
GO
ALTER TABLE [dbo].[DOTes]
	ADD
	CONSTRAINT [DF_DOTes_xPKL_Varie_Show]
	DEFAULT ((0)) FOR [xPKL_Varie_Show]
GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_Agente_1]
	FOREIGN KEY ([Cd_Agente_1]) REFERENCES [dbo].[Agente] ([Cd_Agente])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_Agente_1]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_Agente_2]
	FOREIGN KEY ([Cd_Agente_2]) REFERENCES [dbo].[Agente] ([Cd_Agente])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_Agente_2]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_Aliquota_E]
	FOREIGN KEY ([Cd_Aliquota_E]) REFERENCES [dbo].[Aliquota] ([Cd_Aliquota])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_Aliquota_E]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_Banca]
	FOREIGN KEY ([Cd_CGConto_Banca]) REFERENCES [dbo].[Banca] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_Banca]

GO
ALTER TABLE [dbo].[DOTes]
	WITH CHECK
	ADD CONSTRAINT [FK_DOTes_CD_ReverseCharge]
	FOREIGN KEY ([Cd_ReverseCharge]) REFERENCES [dbo].[ReverseCharge] ([Cd_ReverseCharge])
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CD_ReverseCharge]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_CF]
	FOREIGN KEY ([Cd_CF]) REFERENCES [dbo].[CF] ([Cd_CF])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CF]

GO
ALTER TABLE [dbo].[DOTes]
	WITH CHECK
	ADD CONSTRAINT [FK_DOTes_CF_Fatt]
	FOREIGN KEY ([Cd_CF_Fatt]) REFERENCES [dbo].[CF] ([Cd_CF])
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CF_Fatt]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_CFDest]
	FOREIGN KEY ([Cd_CF], [Cd_CFDest]) REFERENCES [dbo].[CFDest] ([Cd_CF], [Cd_CFDest])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CFDest]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_CFSede]
	FOREIGN KEY ([Cd_CF], [Cd_CFSede]) REFERENCES [dbo].[CFSede] ([Cd_CF], [Cd_CFSede])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CFSede]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_CFZona]
	FOREIGN KEY ([Cd_CFZona]) REFERENCES [dbo].[CFZona] ([Cd_CFZona])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CFZona]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_CN]
	FOREIGN KEY ([Cd_CN]) REFERENCES [dbo].[CN] ([Cd_CN])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_CN]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DO]
	FOREIGN KEY ([Cd_DO]) REFERENCES [dbo].[DO] ([Cd_DO])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DO]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOAspBene]
	FOREIGN KEY ([Cd_DOAspBene]) REFERENCES [dbo].[DOAspBene] ([Cd_DOAspBene])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOAspBene]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOCaricatore]
	FOREIGN KEY ([Cd_DoCaricatore]) REFERENCES [dbo].[DOSdTAnag] ([Cd_DOSdTAnag])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOCaricatore]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOCommittente]
	FOREIGN KEY ([Cd_DoCommittente]) REFERENCES [dbo].[DOSdTAnag] ([Cd_DOSdTAnag])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOCommittente]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOLuogoCarico]
	FOREIGN KEY ([Cd_DoLuogoCarico]) REFERENCES [dbo].[DOSdTAnag] ([Cd_DOSdTAnag])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOLuogoCarico]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOLuogoScarico]
	FOREIGN KEY ([Cd_DoLuogoScarico]) REFERENCES [dbo].[DOSdTAnag] ([Cd_DOSdTAnag])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOLuogoScarico]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOPorto]
	FOREIGN KEY ([Cd_DOPorto]) REFERENCES [dbo].[DOPorto] ([Cd_DOPorto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOPorto]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOProprietarioMerce]
	FOREIGN KEY ([Cd_DoProprietarioMerce]) REFERENCES [dbo].[DOSdTAnag] ([Cd_DOSdTAnag])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOProprietarioMerce]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOSottoCommessa]
	FOREIGN KEY ([Cd_DOSottoCommessa]) REFERENCES [dbo].[DOSottoCommessa] ([Cd_DOSottoCommessa])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOSottoCommessa]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOSped]
	FOREIGN KEY ([Cd_DOSped]) REFERENCES [dbo].[DOSped] ([Cd_DOSped])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOSped]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOTrasporto]
	FOREIGN KEY ([Cd_DOTrasporto]) REFERENCES [dbo].[DOTrasporto] ([Cd_DOTrasporto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOTrasporto]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOVettore_1]
	FOREIGN KEY ([Cd_DOVettore_1]) REFERENCES [dbo].[DOVettore] ([Cd_DOVettore])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOVettore_1]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_DOVettore_2]
	FOREIGN KEY ([Cd_DOVettore_2]) REFERENCES [dbo].[DOVettore] ([Cd_DOVettore])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_DOVettore_2]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_LS_1]
	FOREIGN KEY ([Cd_LS_1]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_LS_1]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_LS_2]
	FOREIGN KEY ([Cd_LS_2]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_LS_2]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_LS_C]
	FOREIGN KEY ([Cd_LS_C]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_LS_C]

GO
ALTER TABLE [dbo].[DOTes]
	WITH CHECK
	ADD CONSTRAINT [FK_DOTes_MGCausale]
	FOREIGN KEY ([Cd_MGCausale]) REFERENCES [dbo].[MGCausale] ([Cd_MGCausale])
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_MGCausale]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_MGEsercizio]
	FOREIGN KEY ([Cd_MGEsercizio]) REFERENCES [dbo].[MGEsercizio] ([Cd_MGEsercizio])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_MGEsercizio]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_PG]
	FOREIGN KEY ([Cd_PG]) REFERENCES [dbo].[PG] ([Cd_PG])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_PG]

GO
ALTER TABLE [dbo].[DOTes]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DOTes_VL]
	FOREIGN KEY ([Cd_VL]) REFERENCES [dbo].[VL] ([Cd_VL])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DOTes]
	CHECK CONSTRAINT [FK_DOTes_VL]

GO
CREATE NONCLUSTERED INDEX [IX_DOTes_BicCode]
	ON [dbo].[DOTes] ([BicCode])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_Agente_1]
	ON [dbo].[DOTes] ([Cd_Agente_1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_Agente_2]
	ON [dbo].[DOTes] ([Cd_Agente_2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CF_Cd_CFDest]
	ON [dbo].[DOTes] ([Cd_CF], [Cd_CFDest])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CF_Cd_CFSede]
	ON [dbo].[DOTes] ([Cd_CF], [Cd_CFSede])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CF_Fatt]
	ON [dbo].[DOTes] ([Cd_CF_Fatt])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CFDest]
	ON [dbo].[DOTes] ([Cd_CFDest])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CFEsenzione]
	ON [dbo].[DOTes] ([Cd_Aliquota_E])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CFSede]
	ON [dbo].[DOTes] ([Cd_CFSede])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CFZona]
	ON [dbo].[DOTes] ([Cd_CFZona])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CGConto_Banca]
	ON [dbo].[DOTes] ([Cd_CGConto_Banca])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_CN_DataDoc]
	ON [dbo].[DOTes] ([Cd_CN], [DataDoc])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOAspBene]
	ON [dbo].[DOTes] ([Cd_DOAspBene])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DoCaricatore]
	ON [dbo].[DOTes] ([Cd_DoCaricatore])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DoCommittente]
	ON [dbo].[DOTes] ([Cd_DoCommittente])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DoLuogoCarico]
	ON [dbo].[DOTes] ([Cd_DoLuogoCarico])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DoLuogoScarico]
	ON [dbo].[DOTes] ([Cd_DoLuogoScarico])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOPorto]
	ON [dbo].[DOTes] ([Cd_DOPorto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DoProprietarioMerce]
	ON [dbo].[DOTes] ([Cd_DoProprietarioMerce])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOSottoCommessa]
	ON [dbo].[DOTes] ([Cd_DOSottoCommessa])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOSped]
	ON [dbo].[DOTes] ([Cd_DOSped])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOTrasporto]
	ON [dbo].[DOTes] ([Cd_DOTrasporto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOVettore_1]
	ON [dbo].[DOTes] ([Cd_DOVettore_1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_DOVettore_2]
	ON [dbo].[DOTes] ([Cd_DOVettore_2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_LS_1]
	ON [dbo].[DOTes] ([Cd_LS_1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_LS_2]
	ON [dbo].[DOTes] ([Cd_LS_2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_LS_C]
	ON [dbo].[DOTes] ([Cd_LS_C])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_MGCausale]
	ON [dbo].[DOTes] ([Cd_MGCausale])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_MGEsercizio]
	ON [dbo].[DOTes] ([Cd_MGEsercizio])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_PG]
	ON [dbo].[DOTes] ([Cd_PG])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_CD_ReverseCharge]
	ON [dbo].[DOTes] ([Cd_ReverseCharge])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Cd_VL]
	ON [dbo].[DOTes] ([Cd_VL])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_CdDO_RigheEvadibili_CFFattR]
	ON [dbo].[DOTes] ([Cd_DO], [RigheEvadibili], [Cd_CF_Fatt_R])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DoTes_Cover4NextNum]
	ON [dbo].[DOTes] ([Cd_CN], [EsAnno], [NumeroDocI])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_DataDoc]
	ON [dbo].[DOTes] ([DataDoc], [NumeroDoc])
	INCLUDE ([Cd_CF], [Cd_DO], [DoBitMask])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_DoBitMask]
	ON [dbo].[DOTes] ([DoBitMask])
	INCLUDE ([Cd_CF], [Cd_DO])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Iban]
	ON [dbo].[DOTes] ([Iban])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DOTes_Tipofattura]
	ON [dbo].[DOTes] ([TipoFattura])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Valore dell''abbuono.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'AbbuonoV'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Valore del cambio.
Si noti che per cambi negativi o 0 o <> 0 con valuta EUR viene forzato 1 senza generare errore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cambio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice agente 1.
ABL Default: CF.Cd_Agente_1
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_Agente_1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice agente 2.
ABL Default: CF.Cd_Agente_2.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_Agente_2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice cliente / fornitore.
Unico campo obbligatorio assieme a Cd_DO.
Il codice deve essere cliente se CliFor = ''C'', fornitore se CliFor = ''F''.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_CF'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Cliente / Fornitore cui fattuare il documento', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_CF_Fatt'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Zona.
ABL Default: CF.Cd_CFZona.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_CFZona'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_CN'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del contatore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_CN'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Aspetto esteriore dei beni.
Default da DO.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOAspBene'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice caricatore.
ABL: Default DOCd_Caricatore.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DoCaricatore'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice committente.
ABL: Default DOCd_Committente.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DoCommittente'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice porto.
Default da DO.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOPorto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice prorietario merce.
ABL: Default DOCd_ProprietarioMerce.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DoProprietarioMerce'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Commessa.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOSottoCommessa'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice spedizione.
Default da DO.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOSped'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Causale trasporto.
Default da DO.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOTrasporto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice primo vettore.
ABL: Default DOCd_Vettore_1.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOVettore_1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice secondo vettore.
ABL: Default DOCd_Vettore_2.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_DOVettore_2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice esercizio di magazzino.
Formula asp_MGEsercizio(ISNULL(DataDoc, GetDate())).
Viene gestito come codice in line before loop in quanto essendo una FK non è possibile gestire formule. Nota che testo con ISNULL il caso di DataDoc NULL in quanto i def', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_MGEsercizio'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice di pagamento.
ABL Default: CF.Cd_PG
Il codice di Pagamento può essere NULL: in questo caso la procedura di generazione scadenze implicitamente genererà una sola rata di tipo Rimessa Diretta.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_PG'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Valuta
ABL Default: CF.Cd_VL.
N.B.: T-SQL Update() dependent.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Cd_VL'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'CliFor'
GO
EXEC sp_addextendedproperty N'MS_Description', N'
C = Documento Cliente
F = Documento Fornitore', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'CliFor'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero colli.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Colli'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Contabile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Consegna.
Attenzione: non viene aggiornata in automatico la data consegna sulle righe in caso di variazione della data consegna di testa.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'DataConsegna'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data documento.
Se non specificata viene automaticamento valorizzata con la data corrente.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'DataDoc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data documento del Cliente/Fornitore.
Obbligatoria per fatture fornitore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'DataDocRif'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero di decimali della valuta.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Decimali'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero di decimali della valuta per i prezzi unitari.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'DecimaliPrzUn'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'EsAnno'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Esecutività del documento (non esecutivo = bozza, no movimenti, no scadenze, no movimento contabile, no prelevabile, etc...)', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Esecutivo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'ID Univoco autogenerato.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Id_DOTes'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'MagAFlag'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'MagPFlag'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Modificabilità del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Modificabile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Note sul documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'NotePiede'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero documento formato da 6 caratteri numerici + ''\'' + eventuali 3 caratteri alfanumerici.
Il carattere ''\'' che separa la parte numerica da quella alfanumerica viene messo in automatico solo se la parte finale alfanumerica non è vuota (altrimenti vien', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'NumeroDoc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Numero del documento del Cliente/Fornitore.
Obbligatorio per fatture fornitore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'NumeroDocRif'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Peso Lordo.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'PesoLordo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Peso Netto.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'PesoNetto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Prelevabilità del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Prelevabile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Riservato per decidere in asp_DO_end la creazione/ricreazione delle entità collegate.
''I'' = Inserito; ''U'' = Update non key field; ''R'' = Rebuild entity
Byte 1 = Castelletto IVA
Byte 2 = Movimento contabile', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Reserved_1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sconto Cassa espresso come stringa di percentuali (Es. 4+1).
Lo sconto cassa verrà applicato al totale fattura e genererà un movimento contabile apposito.
La stringa verrà normalizzata senza generare errore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'ScontoCassa'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data dell''inserimento del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'TimeIns'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data dell''ultimo aggiornamento del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'TimeUpd'
GO
EXEC sp_addextendedproperty N'axp_PreventUserUpdate', N'1', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'TipoDocumento'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipologia di documento. (''F'', ''N'', ''O'', ''B'', etc...)
Per l''elenco dei tipi vedere colonna TipoDocumento in DO.
', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'TipoDocumento'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nome dell''utente esecutore dell''inserimento del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'UserIns'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Nome dell''utente esecutore dell''ultimo aggiornamento al documento.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'UserUpd'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data ritiro primo vettore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Vettore1DataOra'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data ritiro secondo vettore.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'Vettore2DataOra'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Volume.', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'VolumeTotale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Anagrafica cliente aggiuntivo', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'xCd_CF_CA'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizione cliente aggiuntivo', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', 'COLUMN', N'xDesc_CA'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900539', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Teste documenti', 'SCHEMA', N'dbo', 'TABLE', N'DOTes', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[DOTes]
	TO [public]
GO
ALTER TABLE [dbo].[DOTes] SET (LOCK_ESCALATION = TABLE)
GO
