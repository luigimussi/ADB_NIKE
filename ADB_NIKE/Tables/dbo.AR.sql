SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AR] (
		[Id_AR]                        [int] IDENTITY(1, 1) NOT NULL,
		[Cd_AR]                        [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[Descrizione]                  [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
		[Note_AR]                      [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARGruppo1]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARGruppo2]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARGruppo3]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARClasse1]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARClasse2]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARClasse3]                 [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Aliquota_A]                [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_Aliquota_V]                [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGConto_AI]                [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGConto_VI]                [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGConto_AE]                [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGConto_VE]                [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARStato]                   [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARMarca]                   [varchar](20) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARNomenclatura]            [char](8) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARPrdClasse]               [char](5) COLLATE Latin1_General_CI_AS NULL,
		[Id_ARCategoria]               [int] NULL,
		[Modello]                      [varchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
		[Sconto]                       [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[Provvigione]                  [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[ScortaMinima]                 [numeric](18, 8) NOT NULL,
		[ScortaMassima]                [numeric](18, 8) NOT NULL,
		[LottoMinimo]                  [numeric](18, 8) NOT NULL,
		[LottoRiordino]                [numeric](18, 8) NOT NULL,
		[PesoLordo]                    [numeric](18, 4) NOT NULL,
		[PesoNetto]                    [numeric](18, 4) NOT NULL,
		[PesoFattore]                  [numeric](25, 12) NOT NULL,
		[Altezza]                      [numeric](18, 4) NOT NULL,
		[Lunghezza]                    [numeric](18, 4) NOT NULL,
		[Larghezza]                    [numeric](18, 4) NOT NULL,
		[DimensioniFattore]            [numeric](25, 12) NOT NULL,
		[MrpGiorniRiordino]            [smallint] NOT NULL,
		[MrpProduzioneMassima]         [numeric](18, 8) NOT NULL,
		[CostoStandard]                [numeric](18, 6) NOT NULL,
		[TipoValorizzazione]           [tinyint] NOT NULL,
		[NoInventario]                 [bit] NOT NULL,
		[NoGiornale]                   [bit] NOT NULL,
		[ClasseAbc]                    [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[DBFantasma]                   [bit] NOT NULL,
		[MrpIncludi]                   [bit] NOT NULL,
		[MrpGiorniCopertura]           [smallint] NOT NULL,
		[MrpResa]                      [smallint] NOT NULL,
		[MrpLottoRiordino]             [bit] NOT NULL,
		[MrpLottoMinimo]               [bit] NOT NULL,
		[MrpPuntoRiordino]             [tinyint] NOT NULL,
		[WebB2CPubblica]               [bit] NOT NULL,
		[WebDescrizione]               [varchar](80) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserIns]                      [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                      [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                      [smalldatetime] NOT NULL,
		[TimeUpd]                      [smalldatetime] NOT NULL,
		[ts]                           [timestamp] NULL,
		[MrpIgnoraDistinta]            [bit] NOT NULL,
		[Cd_CAVda_VI]                  [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CAVda_VE]                  [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CAVda_AI]                  [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CAVda_AE]                  [char](12) COLLATE Latin1_General_CI_AS NULL,
		[Fittizio]                     [bit] NOT NULL,
		[Obsoleto]                     [bit] NOT NULL,
		[DBKit]                        [bit] NOT NULL,
		[AmsManaged]                   [bit] NOT NULL,
		[Cd_VbReparto]                 [char](2) COLLATE Latin1_General_CI_AS NULL,
		[VBDescrizione]                [varchar](30) COLLATE Latin1_General_CI_AS NULL,
		[DescrizioneBreve]             [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
		[WebGiacenza]                  [numeric](18, 8) NOT NULL,
		[WebInfoLink]                  [varchar](128) COLLATE Latin1_General_CI_AS NOT NULL,
		[WebNote_AR]                   [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[WebB2BPubblica]               [bit] NOT NULL,
		[NoteOfferta]                  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[Ricarica]                     [varchar](15) COLLATE Latin1_General_CI_AS NOT NULL,
		[MG_LottoObbligatorio]         [bit] NOT NULL,
		[MG_GiacenzaNonNegativa]       [bit] NOT NULL,
		[MG_MatricolaObbligatoria]     [bit] NOT NULL,
		[Attributi]                    [xml](CONTENT [dbo].[Attributi]) NULL,
		[NoteXML]                      [xml](CONTENT [dbo].[NoteXML]) NULL,
		[PesoLordoMks]                 AS (isnull([PesoFattore]*[PesoLordo],(0))),
		[PesoNettoMks]                 AS (isnull([PesoFattore]*[PesoNetto],(0))),
		[AltezzaMks]                   AS (isnull([DimensioniFattore]*[Altezza],(0))),
		[LunghezzaMks]                 AS (isnull([DimensioniFattore]*[Lunghezza],(0))),
		[LarghezzaMks]                 AS (isnull([DimensioniFattore]*[Larghezza],(0))),
		[VolumeMks]                    AS (isnull((((([DimensioniFattore]*[Altezza])*[DimensioniFattore])*[Lunghezza])*[DimensioniFattore])*[Larghezza],(0))),
		[TipoGestComm]                 [tinyint] NOT NULL,
		[IntraTipo]                    [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_IntraServizio]             [char](6) COLLATE Latin1_General_CI_AS NULL,
		[xDesigner]                    [varchar](40) COLLATE Latin1_General_CI_AS NULL,
		[xDataRealizzo]                [smalldatetime] NULL,
		[xProfondita]                  [numeric](18, 6) NULL,
		[xPaeseOrigine]                [varchar](60) COLLATE Latin1_General_CI_AS NULL,
		[xFotografato]                 [bit] NULL,
		[xRiservato]                   [bit] NULL,
		[xNoteRiservato]               [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[xSito]                        [bit] NULL,
		[xNoteSito]                    [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[xRestaurato]                  [bit] NULL,
		[xCertificato]                 [bit] NULL,
		[Cd_ARMisura]                  [char](2) COLLATE Latin1_General_CI_AS NULL,
		[FTE_CodiceTipo]               [varchar](35) COLLATE Latin1_General_CI_AS NULL,
		[FTE_CodiceValore]             [varchar](35) COLLATE Latin1_General_CI_AS NULL,
		[Cd_ARClasse12]                AS ([Cd_ARClasse1]+[Cd_ARClasse2]),
		[Cd_ARClasse123]               AS (([Cd_ARClasse1]+[Cd_ARClasse2])+[Cd_ARClasse3]),
		[Cd_ARGruppo12]                AS ([Cd_ARGruppo1]+[Cd_ARGruppo2]),
		[Cd_ARGruppo123]               AS (([Cd_ARGruppo1]+[Cd_ARGruppo2])+[Cd_ARGruppo3]),
		[xDiametro]                    [numeric](18, 4) NOT NULL,
		[Cd_Nazione_Origine]           [char](2) COLLATE Latin1_General_CI_AS NULL,
		CONSTRAINT [IK_AR]
		UNIQUE
		NONCLUSTERED
		([Id_AR])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [PK_AR]
	PRIMARY KEY
	CLUSTERED
	([Cd_AR])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Altezza]
	CHECK
	([Altezza]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900804 | Altezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Altezza'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Altezza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Cd_AR]
	CHECK
	([Cd_AR]=upper([Cd_AR]) collate Latin1_General_CS_AS AND [Cd_AR]<>'')
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900811 | Cd_AR', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Cd_AR'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Cd_AR]
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_AR_Cd_ARClasse123]
	CHECK
	([Cd_ARClasse1] is null and [Cd_ARClasse2] is null and [Cd_ARClasse3] is null or [Cd_ARClasse1] is not null and [Cd_ARClasse2] is not null and [Cd_ARClasse3] is not null)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900786', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Cd_ARClasse123'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Cd_ARClasse123]
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD
	CONSTRAINT [CK_AR_Cd_ARGruppo123]
	CHECK
	([Cd_ARGruppo1] is null and [Cd_ARGruppo2] is null and [Cd_ARGruppo3] is null or [Cd_ARGruppo1] is not null and [Cd_ARGruppo2] is not null and [Cd_ARGruppo3] is not null)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900787', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Cd_ARGruppo123'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Cd_ARGruppo123]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Cd_IntraServizio]
	CHECK
	([Cd_IntraServizio] IS NULL OR isnumeric([Cd_IntraServizio])=(1) AND len([Cd_IntraServizio])=(6))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900688', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Cd_IntraServizio'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Cd_IntraServizio]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_ClasseAbc]
	CHECK
	([ClasseAbc]=' ' OR ([ClasseAbc]='C' OR ([ClasseAbc]='B' OR [ClasseAbc]='A')))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900817', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_ClasseAbc'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_ClasseAbc]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_CostoStandard]
	CHECK
	([CostoStandard]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900812 | CostoStandard', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_CostoStandard'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_CostoStandard]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_DBFantasma_DBKit]
	CHECK
	([DBFantasma]=(0) AND [DBKit]=(0) OR [DBFantasma]=(1))
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_DBFantasma_DBKit]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_DBKit_MG]
	CHECK
	([DBKit]=(0) OR [MG_LottoObbligatorio]=(0) AND [MG_MatricolaObbligatoria]=(0) AND [MG_GiacenzaNonNegativa]=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900373', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_DBKit_MG'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_DBKit_MG]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_DimensioniFattore]
	CHECK
	([DimensioniFattore]<>(0))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900367 | DimensioniFattore', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_DimensioniFattore'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_DimensioniFattore]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Fittizio_MG]
	CHECK
	([Fittizio]=(0) OR [MG_LottoObbligatorio]=(0) AND [MG_MatricolaObbligatoria]=(0) AND [MG_GiacenzaNonNegativa]=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900373', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Fittizio_MG'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Fittizio_MG]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_FittizioFantasma]
	CHECK
	([Fittizio]=(0) OR [DBFantasma]=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900374', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_FittizioFantasma'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_FittizioFantasma]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_IntraTipo]
	CHECK
	([IntraTipo]='S' OR [IntraTipo]='B')
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900690', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_IntraTipo'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_IntraTipo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Larghezza]
	CHECK
	([Larghezza]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900805 | Larghezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Larghezza'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Larghezza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_LottoMinimo]
	CHECK
	([LottoMinimo]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900806 | LottoMinimo', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_LottoMinimo'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_LottoMinimo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_LottoRiordino]
	CHECK
	([LottoRiordino]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900807 | LottoRiordino', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_LottoRiordino'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_LottoRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Lunghezza]
	CHECK
	([Lunghezza]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900808 | Lunghezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Lunghezza'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Lunghezza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_MrpGiorniCopertura]
	CHECK
	([MrpGiorniCopertura]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900361 | MrpGiorniCopertura', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_MrpGiorniCopertura'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_MrpGiorniCopertura]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_MrpGiorniRiordino]
	CHECK
	([MrpGiorniRiordino]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900361 | MrpGiorniRiordino', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_MrpGiorniRiordino'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_MrpGiorniRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_MrpProduzioneMassima]
	CHECK
	([MrpProduzioneMassima]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900361 | MRPProduzioneMassima', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_MrpProduzioneMassima'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_MrpProduzioneMassima]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_MrpPuntoRiordino]
	CHECK
	([MrpPuntoRiordino]>=(1) AND [MrpPuntoRiordino]<=(2))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900372 | MRPPuntoRiordino | (1,2)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_MrpPuntoRiordino'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_MrpPuntoRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_MrpResa]
	CHECK
	([MrpResa]>=(1) AND [MrpResa]<=(100))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900384 | MRPResa | [1,100]', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_MrpResa'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_MrpResa]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_PesoFattore]
	CHECK
	([PesoFattore]<>(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900367 | PesoFattore', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_PesoFattore'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_PesoFattore]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_PesoLordo]
	CHECK
	([PesoLordo]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900809 | PesoLordo', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_PesoLordo'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_PesoLordo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_PesoNetto]
	CHECK
	([PesoNetto]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900810 | PesoNetto', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_PesoNetto'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_PesoNetto]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Provvigione]
	CHECK
	([dbo].[afn_PercStrValid]([Provvigione])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | Provvigione', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Provvigione'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Provvigione]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_Sconto]
	CHECK
	([dbo].[afn_PercStrValid]([Sconto])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | Sconto', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_Sconto'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_Sconto]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_ScortaMassima]
	CHECK
	([ScortaMassima]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900813 | ScortaMassima', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_ScortaMassima'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_ScortaMassima]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_ScortaMinima]
	CHECK
	([ScortaMinima]>=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900814 | ScortaMinima', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_ScortaMinima'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_ScortaMinima]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_TipoGestComm]
	CHECK
	([TipoGestComm]=(2) OR [TipoGestComm]=(1) OR [TipoGestComm]=(0))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900372 | TipoValorizzazione | (0,1,2)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_TipoGestComm'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_TipoGestComm]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [CK_AR_TipoValorizzazione]
	CHECK
	([TipoValorizzazione]=(3) OR ([TipoValorizzazione]=(2) OR [TipoValorizzazione]=(1)))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900372 | TipoValorizzazione | (1,2,3)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'CK_AR_TipoValorizzazione'
GO
ALTER TABLE [dbo].[AR]
CHECK CONSTRAINT [CK_AR_TipoValorizzazione]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Altezza]
	DEFAULT ((0.0)) FOR [Altezza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_AmsManaged]
	DEFAULT ((0)) FOR [AmsManaged]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_ClasseAbc]
	DEFAULT ('') FOR [ClasseAbc]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_CostoStandard]
	DEFAULT ((0)) FOR [CostoStandard]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_DBFantasma]
	DEFAULT ((0)) FOR [DBFantasma]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_DBFase]
	DEFAULT ((0)) FOR [Fittizio]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_DBKit]
	DEFAULT ((0)) FOR [DBKit]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Descrizione]
	DEFAULT ('') FOR [Descrizione]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_DescrizioneBreve]
	DEFAULT ('') FOR [DescrizioneBreve]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_DimensioniFattore]
	DEFAULT ((1.0)) FOR [DimensioniFattore]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_IntraTipo]
	DEFAULT ('B') FOR [IntraTipo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Larghezza]
	DEFAULT ((0.0)) FOR [Larghezza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_LottoMinimo]
	DEFAULT ((0)) FOR [LottoMinimo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_LottoRiordino]
	DEFAULT ((0)) FOR [LottoRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Lunghezza]
	DEFAULT ((0.0)) FOR [Lunghezza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MG_GiacenzaNonNegativa]
	DEFAULT ((0)) FOR [MG_GiacenzaNonNegativa]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MG_LottoObbligatorio]
	DEFAULT ((0)) FOR [MG_LottoObbligatorio]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MG_MatricolaObbligatoria]
	DEFAULT ((0)) FOR [MG_MatricolaObbligatoria]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Modello]
	DEFAULT ('') FOR [Modello]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpGiorniCopertura]
	DEFAULT ((30)) FOR [MrpGiorniCopertura]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpGiorniRiordino]
	DEFAULT ((0)) FOR [MrpGiorniRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpIgnoraDistinta]
	DEFAULT ((0)) FOR [MrpIgnoraDistinta]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpIncludi]
	DEFAULT ((1)) FOR [MrpIncludi]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpLottoRiordino]
	DEFAULT ((1)) FOR [MrpLottoRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpMultipliLotto]
	DEFAULT ((1)) FOR [MrpLottoMinimo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpProduzioneMassima]
	DEFAULT ((0)) FOR [MrpProduzioneMassima]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_MrpPuntoRiordino]
	DEFAULT ((2)) FOR [MrpPuntoRiordino]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_NoGiornale]
	DEFAULT ((0)) FOR [NoGiornale]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_NoInventario]
	DEFAULT ((0)) FOR [NoInventario]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Obsoleto]
	DEFAULT ((0)) FOR [Obsoleto]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_PesoFattore]
	DEFAULT ((1.0)) FOR [PesoFattore]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_PesoLordo]
	DEFAULT ((0.0)) FOR [PesoLordo]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_PesoNetto]
	DEFAULT ((0.0)) FOR [PesoNetto]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Provvigione]
	DEFAULT ('') FOR [Provvigione]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Resa]
	DEFAULT ((100)) FOR [MrpResa]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Ricarica]
	DEFAULT ('') FOR [Ricarica]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_Sconto]
	DEFAULT ('') FOR [Sconto]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_ScortaMassima]
	DEFAULT ((0)) FOR [ScortaMassima]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_ScortaMinima]
	DEFAULT ((0)) FOR [ScortaMinima]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_TipoGestComm]
	DEFAULT ((0)) FOR [TipoGestComm]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_TipoValorizzazione]
	DEFAULT ((1)) FOR [TipoValorizzazione]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_WebB2BPubblica]
	DEFAULT ((1)) FOR [WebB2BPubblica]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_WebB2CPubblica]
	DEFAULT ((0)) FOR [WebB2CPubblica]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_WebDescrizione]
	DEFAULT ('') FOR [WebDescrizione]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_WebGiacenza]
	DEFAULT ((0)) FOR [WebGiacenza]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_WebInfoLink]
	DEFAULT ('') FOR [WebInfoLink]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_xCertificato]
	DEFAULT ((0)) FOR [xCertificato]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_xDiametro]
	DEFAULT ((0)) FOR [xDiametro]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_xFotografato]
	DEFAULT ((0)) FOR [xFotografato]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_xRestaurato]
	DEFAULT ((0)) FOR [xRestaurato]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_xRiservato]
	DEFAULT ((0)) FOR [xRiservato]
GO
ALTER TABLE [dbo].[AR]
	ADD
	CONSTRAINT [DF_AR_xSito]
	DEFAULT ((0)) FOR [xSito]
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_Aliquota_A]
	FOREIGN KEY ([Cd_Aliquota_A]) REFERENCES [dbo].[Aliquota] ([Cd_Aliquota])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_Aliquota_A]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908035', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_Aliquota_A'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_Aliquota_V]
	FOREIGN KEY ([Cd_Aliquota_V]) REFERENCES [dbo].[Aliquota] ([Cd_Aliquota])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_Aliquota_V]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908036', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_Aliquota_V'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARCategoria]
	FOREIGN KEY ([Id_ARCategoria]) REFERENCES [dbo].[ARCategoria] ([Id_ARCategoria])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_ARCategoria]

GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARClasse1]
	FOREIGN KEY ([Cd_ARClasse1]) REFERENCES [dbo].[ARClasse1] ([Cd_ARClasse1])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	NOCHECK CONSTRAINT [FK_AR_ARClasse1]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908006', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARClasse1'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARClasse2]
	FOREIGN KEY ([Cd_ARClasse1], [Cd_ARClasse2]) REFERENCES [dbo].[ARClasse2] ([Cd_ARClasse1], [Cd_ARClasse2])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	NOCHECK CONSTRAINT [FK_AR_ARClasse2]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908007', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARClasse2'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARClasse3]
	FOREIGN KEY ([Cd_ARClasse1], [Cd_ARClasse2], [Cd_ARClasse3]) REFERENCES [dbo].[ARClasse3] ([Cd_ARClasse1], [Cd_ARClasse2], [Cd_ARClasse3])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_ARClasse3]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908008', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARClasse3'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARGruppo1]
	FOREIGN KEY ([Cd_ARGruppo1]) REFERENCES [dbo].[ARGruppo1] ([Cd_ARGruppo1])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	NOCHECK CONSTRAINT [FK_AR_ARGruppo1]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908009', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARGruppo1'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARGruppo2]
	FOREIGN KEY ([Cd_ARGruppo1], [Cd_ARGruppo2]) REFERENCES [dbo].[ARGruppo2] ([Cd_ARGruppo1], [Cd_ARGruppo2])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	NOCHECK CONSTRAINT [FK_AR_ARGruppo2]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908010', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARGruppo2'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARGruppo3]
	FOREIGN KEY ([Cd_ARGruppo1], [Cd_ARGruppo2], [Cd_ARGruppo3]) REFERENCES [dbo].[ARGruppo3] ([Cd_ARGruppo1], [Cd_ARGruppo2], [Cd_ARGruppo3])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_ARGruppo3]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908011', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARGruppo3'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARMarca]
	FOREIGN KEY ([Cd_ARMarca]) REFERENCES [dbo].[ARMarca] ([Cd_ARMarca])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_ARMarca]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908037', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARMarca'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARMisura]
	FOREIGN KEY ([Cd_ARMisura]) REFERENCES [dbo].[ARMisura] ([Cd_ARMisura])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	NOCHECK CONSTRAINT [FK_AR_ARMisura]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908009', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARMisura'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARPrdClasse]
	FOREIGN KEY ([Cd_ARPrdClasse]) REFERENCES [dbo].[ARPrdClasse] ([Cd_ARPrdClasse])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_ARPrdClasse]

GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_ARStato]
	FOREIGN KEY ([Cd_ARStato]) REFERENCES [dbo].[ARStato] ([Cd_ARStato])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_ARStato]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908013', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_ARStato'
GO
ALTER TABLE [dbo].[AR]
	WITH CHECK
	ADD CONSTRAINT [FK_AR_CAVda_AE]
	FOREIGN KEY ([Cd_CAVda_AE]) REFERENCES [dbo].[CAVda] ([Cd_CAVda])
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CAVda_AE]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908038', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CAVda_AE'
GO
ALTER TABLE [dbo].[AR]
	WITH CHECK
	ADD CONSTRAINT [FK_AR_CAVda_AI]
	FOREIGN KEY ([Cd_CAVda_AI]) REFERENCES [dbo].[CAVda] ([Cd_CAVda])
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CAVda_AI]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908039', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CAVda_AI'
GO
ALTER TABLE [dbo].[AR]
	WITH CHECK
	ADD CONSTRAINT [FK_AR_CAVda_VE]
	FOREIGN KEY ([Cd_CAVda_VE]) REFERENCES [dbo].[CAVda] ([Cd_CAVda])
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CAVda_VE]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908040', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CAVda_VE'
GO
ALTER TABLE [dbo].[AR]
	WITH CHECK
	ADD CONSTRAINT [FK_AR_CAVda_VI]
	FOREIGN KEY ([Cd_CAVda_VI]) REFERENCES [dbo].[CAVda] ([Cd_CAVda])
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CAVda_VI]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908041', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CAVda_VI'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_CGConto_AE]
	FOREIGN KEY ([Cd_CGConto_AE]) REFERENCES [dbo].[CGConto] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CGConto_AE]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908042', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CGConto_AE'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_CGConto_AI]
	FOREIGN KEY ([Cd_CGConto_AI]) REFERENCES [dbo].[CGConto] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CGConto_AI]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908043', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CGConto_AI'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_CGConto_VE]
	FOREIGN KEY ([Cd_CGConto_VE]) REFERENCES [dbo].[CGConto] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CGConto_VE]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908044', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CGConto_VE'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_CGConto_VI]
	FOREIGN KEY ([Cd_CGConto_VI]) REFERENCES [dbo].[CGConto] ([Cd_CGConto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_CGConto_VI]

GO
EXEC sp_addextendedproperty N'axp_ErrMsgInsUpd', N'908045', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'CONSTRAINT', N'FK_AR_CGConto_VI'
GO
ALTER TABLE [dbo].[AR]
	WITH NOCHECK
	ADD CONSTRAINT [FK_AR_Nazione_Origine]
	FOREIGN KEY ([Cd_Nazione_Origine]) REFERENCES [dbo].[Nazione] ([Cd_Nazione])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_Nazione_Origine]

GO
ALTER TABLE [dbo].[AR]
	WITH CHECK
	ADD CONSTRAINT [FK_AR_VbReparto]
	FOREIGN KEY ([Cd_VbReparto]) REFERENCES [dbo].[VbReparto] ([Cd_VbReparto])
ALTER TABLE [dbo].[AR]
	CHECK CONSTRAINT [FK_AR_VbReparto]

GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_Aliquota_A]
	ON [dbo].[AR] ([Cd_Aliquota_A])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_Aliquota_V]
	ON [dbo].[AR] ([Cd_Aliquota_V])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARClasse1]
	ON [dbo].[AR] ([Cd_ARClasse1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARClasse2]
	ON [dbo].[AR] ([Cd_ARClasse2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARClasse3]
	ON [dbo].[AR] ([Cd_ARClasse3])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARGruppo1]
	ON [dbo].[AR] ([Cd_ARGruppo1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARGruppo2]
	ON [dbo].[AR] ([Cd_ARGruppo2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARGruppo3]
	ON [dbo].[AR] ([Cd_ARGruppo3])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARMarca]
	ON [dbo].[AR] ([Cd_ARMarca])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARMisura]
	ON [dbo].[AR] ([Cd_ARMisura])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARNomenclatura]
	ON [dbo].[AR] ([Cd_ARNomenclatura])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARPrdClasse]
	ON [dbo].[AR] ([Cd_ARPrdClasse])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_ARStato]
	ON [dbo].[AR] ([Cd_ARStato])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CAVda_AE]
	ON [dbo].[AR] ([Cd_CAVda_AE])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CAVda_AI]
	ON [dbo].[AR] ([Cd_CAVda_AI])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CAVda_VE]
	ON [dbo].[AR] ([Cd_CAVda_VE])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CAVda_VI]
	ON [dbo].[AR] ([Cd_CAVda_VI])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CGConto_AE]
	ON [dbo].[AR] ([Cd_CGConto_AE])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CGConto_AI]
	ON [dbo].[AR] ([Cd_CGConto_AI])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CGConto_VE]
	ON [dbo].[AR] ([Cd_CGConto_VE])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_CGConto_VI]
	ON [dbo].[AR] ([Cd_CGConto_VI])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_Nazione_Origine]
	ON [dbo].[AR] ([Cd_Nazione_Origine])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Cd_VbReparto]
	ON [dbo].[AR] ([Cd_VbReparto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Descrizione]
	ON [dbo].[AR] ([Descrizione])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Fittizio]
	ON [dbo].[AR] ([Fittizio])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Id_ARCategoria]
	ON [dbo].[AR] ([Id_ARCategoria])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AR_Obsoleto]
	ON [dbo].[AR] ([Obsoleto])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Altezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Altezza'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Altezza in metri', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'AltezzaMks'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice IVA acquisti', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_Aliquota_A'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice IVA vendite', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_Aliquota_V'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Articolo', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_AR'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice classe di primo livello', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARClasse1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'codice classe di secondo livello', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARClasse2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice classe di terzo livello
Ci sarà a livello di trigger una routine per valorizzare i tre campi Cd_ARClasse1/2/3 con valori di Default.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARClasse3'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Gruppo di primo livello', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARGruppo1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice gruppo di secondo livello', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARGruppo2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Gruppo di terzo livello.
Ci sarà a livello di trigger una routine per valorizzare i tre campi Cd_ARGruppo1/2/3 con valori di Default.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARGruppo3'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice Nomenclatura combinata', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARNomenclatura'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Classe di pianificazione', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARPrdClasse'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice stato dell''Articolo.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Cd_ARStato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Classe ABC ', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'ClasseAbc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Costo Standard', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'CostoStandard'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Articolo Fantasma se utilizzato in Distinta Base', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'DBFantasma'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizione breve dell''articolo.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Descrizione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fattore in cui sono espresse Altezza/Lunghezza/Larghezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'DimensioniFattore'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Larghezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Larghezza'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Larghezza in metri', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'LarghezzaMks'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Lotto minimo di riordino', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'LottoMinimo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Multipli del lotto di riordino.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'LottoRiordino'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Lunghezza', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Lunghezza'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Lunghezza in metri', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'LunghezzaMks'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Giorni di copertura proposta ordine per l''Mrp', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpGiorniCopertura'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Giorni di riordino.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpGiorniRiordino'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se l''Mrp deve trattare l''articolo come una materia prima', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpIgnoraDistinta'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Includi nell''elaborazione Mrp', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpIncludi'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se l''Mrp nelle proposte deve onorare anche i multipli del lotto.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpLottoMinimo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se l''Mrp nelle proposte deve onorare anche il lotto di riordino', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpLottoRiordino'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Produzione massima giornaliera.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpProduzioneMassima'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1 - Riordino quando Disponibile < 0, 2 - Riordino quando Disponibile < Scorta Minima', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpPuntoRiordino'
GO
EXEC sp_addextendedproperty N'MS_Description', N'% di resa (incrementa/decrementa le qta proposte dall''Mrp)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'MrpResa'
GO
EXEC sp_addextendedproperty N'MS_Description', N'.T. se l''articolo non deve essere stampato sul giornale di magazzino', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'NoGiornale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'.T. se l''articolo non deve apparire nella stampa fiscale di inventario.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'NoInventario'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizone lunga.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Note_AR'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Unità di misura in cui sono espressi i Pesi (fattore moltiplicativo per ottenere Kg)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'PesoFattore'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Peso Lordo', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'PesoLordo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Peso Lordo in kilogrammi', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'PesoLordoMks'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Peso Netto', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'PesoNetto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Peso Netto in Kg', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'PesoNettoMks'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione per la % di provvigione (Es: 10 o 10+4 o 10+4-2)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Provvigione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione per la % di sconto (Es: 10 o 10+4 o 10+4-2)', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'Sconto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Scorta minima', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'ScortaMinima'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data inserimento del record.
', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'TimeIns'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data ultimo aggiornamento del record.', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'TimeUpd'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipo di valorizzazione da utilizzare per questo articolo nella stampa di inventario:
   1 LIFO
   2 FIFO
   3 Medio ponderato', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'TipoValorizzazione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Utente che ha eseguito l''Inserimento del record.
', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'UserIns'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Utente che ha eseguito l''ultimo aggiornamento del record.
', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'UserUpd'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Volume in metri cubi', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'VolumeMks'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se l''articolo deve essere esposto nel Web Catalog', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'WebB2CPubblica'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Descrizione per il  Web Catalog', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'WebDescrizione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Certificato', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xCertificato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Data Realizzo', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xDataRealizzo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Designer', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xDesigner'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Diametro', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xDiametro'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Fotografato', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xFotografato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Note Riservato', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xNoteRiservato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Note Sito', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xNoteSito'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Paese di Origine', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xPaeseOrigine'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Profondita', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xProfondita'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Restaurato', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xRestaurato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Riservato', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xRiservato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Sito', 'SCHEMA', N'dbo', 'TABLE', N'AR', 'COLUMN', N'xSito'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900430', 'SCHEMA', N'dbo', 'TABLE', N'AR', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Articoli di magazzino', 'SCHEMA', N'dbo', 'TABLE', N'AR', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[AR]
	TO [public]
GO
SET ANSI_PADDING ON
GO
CREATE PRIMARY XML INDEX [MX_AR_Attributi]
	ON [dbo].[AR] ([Attributi])
GO
SET ANSI_PADDING ON
GO
CREATE XML INDEX [MX_AR_Attributi_Value]
	ON [dbo].[AR] ([Attributi])
	USING XML INDEX [MX_AR_Attributi]
	FOR VALUE
GO
ALTER TABLE [dbo].[AR] SET (LOCK_ESCALATION = TABLE)
GO
