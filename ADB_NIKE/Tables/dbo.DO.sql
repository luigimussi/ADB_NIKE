SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DO] (
		[Id_DO]                         [int] IDENTITY(1, 1) NOT NULL,
		[Cd_DO]                         [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[Descrizione]                   [varchar](60) COLLATE Latin1_General_CI_AS NOT NULL,
		[TipoDocumento]                 [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[NoteDo]                        [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[CliFor]                        [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_MGCausale]                  [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CGCausale]                  [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_CN]                         [char](3) COLLATE Latin1_General_CI_AS NOT NULL,
		[Cd_DOVettore_1]                [char](2) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOVettore_2]                [char](2) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOAspBene]                  [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOTrasporto]                [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOSped]                     [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_DOPorto]                    [char](3) COLLATE Latin1_General_CI_AS NULL,
		[Cd_LS_1]                       [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_LS_2]                       [char](7) COLLATE Latin1_General_CI_AS NULL,
		[Cd_LS_C]                       [char](7) COLLATE Latin1_General_CI_AS NULL,
		[ScontoCassa]                   [varchar](1000) COLLATE Latin1_General_CI_AS NOT NULL,
		[ScontoRiga]                    [varchar](1000) COLLATE Latin1_General_CI_AS NOT NULL,
		[ProvvigioneRiga_1]             [varchar](1000) COLLATE Latin1_General_CI_AS NOT NULL,
		[ProvvigioneRiga_2]             [varchar](1000) COLLATE Latin1_General_CI_AS NOT NULL,
		[Sconto]                        [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[Provvigione]                   [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
		[AggiornaUltimoCosto]           [bit] NOT NULL,
		[Esecutivo]                     [bit] NOT NULL,
		[UIChkGiacenza]                 [bit] NOT NULL,
		[UIChkDisponibile]              [bit] NOT NULL,
		[UIChkDisponibileImmediato]     [bit] NOT NULL,
		[UIPropDataOra]                 [bit] NOT NULL,
		[UIRigaRifGenera]               [bit] NOT NULL,
		[UIRigaRifExp]                  [varchar](max) COLLATE Latin1_General_CI_AS NULL,
		[UIRigaRifPreleva]              [bit] NOT NULL,
		[UIChkFido]                     [bit] NOT NULL,
		[UIChkFidoBlk]                  [bit] NOT NULL,
		[UIChkFidoVis]                  [bit] NOT NULL,
		[UIChkFidoFin]                  [bit] NOT NULL,
		[UIChkFidoBo]                   [bit] NOT NULL,
		[UIChkFidoOc]                   [bit] NOT NULL,
		[UserIns]                       [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[UserUpd]                       [varchar](48) COLLATE Latin1_General_CI_AS NOT NULL,
		[TimeIns]                       [smalldatetime] NOT NULL,
		[TimeUpd]                       [smalldatetime] NOT NULL,
		[ts]                            [timestamp] NULL,
		[PkLstEnabled]                  [bit] NOT NULL,
		[PkLstMode]                     [tinyint] NOT NULL,
		[PkLstFormat]                   [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[PkLstInputMask]                [varchar](24) COLLATE Latin1_General_CI_AS NOT NULL,
		[MtrEnabled]                    [bit] NOT NULL,
		[MtrFormat]                     [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
		[MtrInputMask]                  [varchar](90) COLLATE Latin1_General_CI_AS NOT NULL,
		[CAEnabled]                     [bit] NOT NULL,
		[Prelevabile]                   [bit] NOT NULL,
		[Modificabile]                  [bit] NOT NULL,
		[UIMgMovEdit]                   [bit] NOT NULL,
		[IvaPerRiga]                    [bit] NOT NULL,
		[UIChkFidoBlkE]                 [bit] NOT NULL,
		[RR_Enabled]                    [bit] NOT NULL,
		[Cd_RRConfig]                   [char](10) COLLATE Latin1_General_CI_AS NULL,
		[SegnoSCPrevista]               [smallint] NOT NULL,
		[PromozioniADataConsegna]       [bit] NOT NULL,
		[AggiornaUltimoCosto_AM]        [bit] NOT NULL,
		[UIAbilitaTipoPC]               [bit] NOT NULL,
		[SegnoFido]                     [smallint] NOT NULL,
		[CAGenerate]                    [bit] NOT NULL,
		[SegnoFatturato]                [smallint] NOT NULL,
		[ExportToADW]                   [bit] NOT NULL,
		[CGDefinitivo]                  [bit] NOT NULL,
		[UIPropDataConsegna]            [bit] NOT NULL,
		[ARLottoAuto]                   [tinyint] NOT NULL,
		[DescrizioneBreve]              [varchar](40) COLLATE Latin1_General_CI_AS NOT NULL,
		[BloccaContabilizzati]          [bit] NOT NULL,
		[ArrotondamentoN]               [numeric](5, 2) NOT NULL,
		[ArrotondamentoC]               [char](1) COLLATE Latin1_General_CI_AS NOT NULL,
		[ImportiIvati]                  [bit] NOT NULL,
		[Contabile]                     AS (isnull(CONVERT([bit],case when [Cd_CGCausale] IS NOT NULL then (1) else (0) end),(0))),
		[AutoArchivia]                  [bit] NOT NULL,
		[xPKL_GestionePackingList]      [bit] NOT NULL,
		CONSTRAINT [IK_DO]
		UNIQUE
		NONCLUSTERED
		([Id_DO])
		ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [PK_DO]
	PRIMARY KEY
	CLUSTERED
	([Cd_DO])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_ARLottoAuto]
	CHECK
	([ARLottoAuto]=(3) OR [ARLottoAuto]=(2) OR [ARLottoAuto]=(1) OR [ARLottoAuto]=(0))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900684', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_ARLottoAuto'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_ARLottoAuto]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_ArrotondamentoC]
	CHECK
	([ArrotondamentoC]='D' OR [ArrotondamentoC]='E' OR [ArrotondamentoC]='C')
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900716', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_ArrotondamentoC'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_ArrotondamentoC]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_ArrotondamentoN]
	CHECK
	([ArrotondamentoN]>=(0) AND [ArrotondamentoN]<=(100))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900715', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_ArrotondamentoN'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_ArrotondamentoN]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_BloccaContabilizzati]
	CHECK
	([BloccaContabilizzati]=(0) OR [Cd_CGCausale] IS NOT NULL)
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900712', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_BloccaContabilizzati'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_BloccaContabilizzati]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_CAGenerate]
	CHECK
	([CAEnabled]=(1) OR [CAGenerate]=(0))
GO
EXEC sp_addextendedproperty N'Axp_ErrMsg', N'900381', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_CAGenerate'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_CAGenerate]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_Cd_DO]
	CHECK
	([Cd_DO]<>'')
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900929 | Cd_DO', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_Cd_DO'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_Cd_DO]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_Do_Cd_LS_C]
	CHECK
	([Cd_LS_C] is null)
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_Do_Cd_LS_C]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_CliFor]
	CHECK
	([CliFor]='F' OR [CliFor]='C')
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_CliFor]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_PkLstMode]
	CHECK
	([PkLstMode]=(1) OR [PkLstMode]=(2) AND [PkLstEnabled]=(1))
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_PkLstMode]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_Provvigione]
	CHECK
	([dbo].[afn_PercStrValid]([Provvigione])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | Provvigione', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_Provvigione'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_Provvigione]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_Sconto]
	CHECK
	([dbo].[afn_PercStrValid]([Sconto])=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900359 | Sconto', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_DO_Sconto'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_Sconto]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_Do_SegnoFatturato]
	CHECK
	([SegnoFatturato]=(1) OR ([SegnoFatturato]=(0) OR [SegnoFatturato]=(-1)))
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_Do_SegnoFatturato]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_Do_SegnoFido]
	CHECK
	([SegnoFido]>=(-1) AND [SegnoFido]<=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900372 | SegnoFido | (0,1,-1)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_Do_SegnoFido'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_Do_SegnoFido]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_Do_SegnoSCPrevista]
	CHECK
	([SegnoSCPrevista]>=(-1) AND [SegnoSCPrevista]<=(1))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900372 | SegnoSCPrevista | (+1,-1)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_Do_SegnoSCPrevista'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_Do_SegnoSCPrevista]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_Do_SegnoSCPrevista_TipoDocumento]
	CHECK
	([SegnoSCPrevista]=(0) OR ([TipoDocumento]='O' OR [TipoDocumento]='B' OR [TipoDocumento]='L' OR [TipoDocumento]='D'))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900388', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_Do_SegnoSCPrevista_TipoDocumento'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_Do_SegnoSCPrevista_TipoDocumento]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_DO_TipoDocumento]
	CHECK
	([TipoDocumento]='R' OR ([TipoDocumento]='T' OR ([TipoDocumento]='V' OR ([TipoDocumento]='L' OR ([TipoDocumento]='G' OR ([TipoDocumento]='D' OR ([TipoDocumento]='M' OR ([TipoDocumento]='N' OR ([TipoDocumento]='A' OR ([TipoDocumento]='F' OR ([TipoDocumento]='B' OR ([TipoDocumento]='O' OR [TipoDocumento]='P'))))))))))))
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_DO_TipoDocumento]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [CK_Do_TipoDocumento_SegnoFido]
	CHECK
	([SegnoFido]=(0) OR ([TipoDocumento]='B' OR [TipoDocumento]='O'))
GO
EXEC sp_addextendedproperty N'axp_ErrMsg', N'900383', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'CONSTRAINT', N'CK_Do_TipoDocumento_SegnoFido'
GO
ALTER TABLE [dbo].[DO]
CHECK CONSTRAINT [CK_Do_TipoDocumento_SegnoFido]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_AggiornaUltimoCosto]
	DEFAULT ((0)) FOR [AggiornaUltimoCosto]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_AggiornaUltimoCosto_AM]
	DEFAULT ((0)) FOR [AggiornaUltimoCosto_AM]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ARLottoAuto]
	DEFAULT ((0)) FOR [ARLottoAuto]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ArrotondamentoC]
	DEFAULT ('C') FOR [ArrotondamentoC]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ArrotondamentoN]
	DEFAULT ((0)) FOR [ArrotondamentoN]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_AutoArchivia]
	DEFAULT ((0)) FOR [AutoArchivia]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_BloccaContabilizzati]
	DEFAULT ((0)) FOR [BloccaContabilizzati]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_CAEnabled]
	DEFAULT ((0)) FOR [CAEnabled]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_CAGenerate]
	DEFAULT ((0)) FOR [CAGenerate]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_CGDefinitivo]
	DEFAULT ((0)) FOR [CGDefinitivo]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ChkFidoBlk]
	DEFAULT ((0)) FOR [UIChkFidoBlk]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ChkFidoBo]
	DEFAULT ((0)) FOR [UIChkFidoBo]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ChkFidoFin]
	DEFAULT ((0)) FOR [UIChkFidoFin]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ChkFidoOc]
	DEFAULT ((0)) FOR [UIChkFidoOc]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ChkFidoVis]
	DEFAULT ((0)) FOR [UIChkFidoVis]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_CliFor]
	DEFAULT ('C') FOR [CliFor]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_Descrizione]
	DEFAULT ('') FOR [Descrizione]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_DescrizioneBreve]
	DEFAULT ('') FOR [DescrizioneBreve]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_Esecutivo]
	DEFAULT ((1)) FOR [Esecutivo]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_ExportToADW]
	DEFAULT ((0)) FOR [ExportToADW]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ImportiIvati]
	DEFAULT ((0)) FOR [ImportiIvati]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_IvaPerRiga]
	DEFAULT ((0)) FOR [IvaPerRiga]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_Modificabile]
	DEFAULT ((1)) FOR [Modificabile]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_MtrEnabled]
	DEFAULT ((0)) FOR [MtrEnabled]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_MtrFormat]
	DEFAULT ('') FOR [MtrFormat]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_MtrInputMask]
	DEFAULT ('') FOR [MtrInputMask]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_PkLstEnabled]
	DEFAULT ((0)) FOR [PkLstEnabled]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_PkLstFormat]
	DEFAULT ('') FOR [PkLstFormat]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_PkLstInputMask]
	DEFAULT ('') FOR [PkLstInputMask]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_PkLstMode]
	DEFAULT ((1)) FOR [PkLstMode]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_Prelevabile]
	DEFAULT ((1)) FOR [Prelevabile]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_PromozioniADataConsegna]
	DEFAULT ((0)) FOR [PromozioniADataConsegna]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_Provvigione]
	DEFAULT ('') FOR [Provvigione]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ProvvigioneRiga_1]
	DEFAULT ('') FOR [ProvvigioneRiga_1]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ProvvigioneRiga_2]
	DEFAULT ('') FOR [ProvvigioneRiga_2]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_RR_Enabled]
	DEFAULT ((0)) FOR [RR_Enabled]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_Sconto]
	DEFAULT ('') FOR [Sconto]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ScontoCassa]
	DEFAULT ('') FOR [ScontoCassa]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_ScontoRiga]
	DEFAULT ('') FOR [ScontoRiga]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_SegnoFatturato]
	DEFAULT ((0)) FOR [SegnoFatturato]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_SegnoFido]
	DEFAULT ((0)) FOR [SegnoFido]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_SegnoSCPrevista]
	DEFAULT ((0)) FOR [SegnoSCPrevista]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_TimeIns]
	DEFAULT (getdate()) FOR [TimeIns]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_TimeUpd]
	DEFAULT (getdate()) FOR [TimeUpd]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_TipoDocumento]
	DEFAULT ('G') FOR [TipoDocumento]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIAbilitaTipoPC]
	DEFAULT ((0)) FOR [UIAbilitaTipoPC]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIChkDisponibile]
	DEFAULT ((0)) FOR [UIChkDisponibile]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIChkDisponibileImmediato]
	DEFAULT ((0)) FOR [UIChkDisponibileImmediato]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIChkFido]
	DEFAULT ((0)) FOR [UIChkFido]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIChkFidoBlkE]
	DEFAULT ((0)) FOR [UIChkFidoBlkE]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIChkGiacenza]
	DEFAULT ((0)) FOR [UIChkGiacenza]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_Do_UIMgMovEdit]
	DEFAULT ((0)) FOR [UIMgMovEdit]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIPropDataConsegna]
	DEFAULT ((0)) FOR [UIPropDataConsegna]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIPropDataOra]
	DEFAULT ((0)) FOR [UIPropDataOra]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIRigaRifGenera]
	DEFAULT ((0)) FOR [UIRigaRifGenera]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UIRigaRifPreleva]
	DEFAULT ((1)) FOR [UIRigaRifPreleva]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UserIns]
	DEFAULT (host_name()) FOR [UserIns]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_UserUpd]
	DEFAULT (host_name()) FOR [UserUpd]
GO
ALTER TABLE [dbo].[DO]
	ADD
	CONSTRAINT [DF_DO_xPKL_GestionePackingList]
	DEFAULT ((0)) FOR [xPKL_GestionePackingList]
GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_CGCausale]
	FOREIGN KEY ([Cd_CGCausale]) REFERENCES [dbo].[CGCausale] ([Cd_CGCausale])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_CGCausale]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_CN]
	FOREIGN KEY ([Cd_CN]) REFERENCES [dbo].[CN] ([Cd_CN])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_CN]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_DOAspBene]
	FOREIGN KEY ([Cd_DOAspBene]) REFERENCES [dbo].[DOAspBene] ([Cd_DOAspBene])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_DOAspBene]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_DOPorto]
	FOREIGN KEY ([Cd_DOPorto]) REFERENCES [dbo].[DOPorto] ([Cd_DOPorto])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_DOPorto]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_DOSped]
	FOREIGN KEY ([Cd_DOSped]) REFERENCES [dbo].[DOSped] ([Cd_DOSped])
	ON DELETE SET NULL
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_DOSped]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_DOTrasporto]
	FOREIGN KEY ([Cd_DOTrasporto]) REFERENCES [dbo].[DOTrasporto] ([Cd_DOTrasporto])
	ON DELETE SET NULL
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_DOTrasporto]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_DOVettore_1]
	FOREIGN KEY ([Cd_DOVettore_1]) REFERENCES [dbo].[DOVettore] ([Cd_DOVettore])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_DOVettore_1]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_DOVettore_2]
	FOREIGN KEY ([Cd_DOVettore_2]) REFERENCES [dbo].[DOVettore] ([Cd_DOVettore])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_DOVettore_2]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_LS_1]
	FOREIGN KEY ([Cd_LS_1]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_LS_1]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_LS_2]
	FOREIGN KEY ([Cd_LS_2]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_LS_2]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_DO_LS_C]
	FOREIGN KEY ([Cd_LS_C]) REFERENCES [dbo].[LS] ([Cd_LS])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_LS_C]

GO
ALTER TABLE [dbo].[DO]
	WITH CHECK
	ADD CONSTRAINT [FK_DO_MGCausale]
	FOREIGN KEY ([Cd_MGCausale]) REFERENCES [dbo].[MGCausale] ([Cd_MGCausale])
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_DO_MGCausale]

GO
ALTER TABLE [dbo].[DO]
	WITH NOCHECK
	ADD CONSTRAINT [FK_Do_RRConfig]
	FOREIGN KEY ([Cd_RRConfig]) REFERENCES [dbo].[RRConfig] ([Cd_RRConfig])
	NOT FOR REPLICATION
ALTER TABLE [dbo].[DO]
	CHECK CONSTRAINT [FK_Do_RRConfig]

GO
CREATE NONCLUSTERED INDEX [IX_DO_CAGenerate]
	ON [dbo].[DO] ([CAGenerate])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_CGCausale]
	ON [dbo].[DO] ([Cd_CGCausale])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_CN]
	ON [dbo].[DO] ([Cd_CN])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_DOAspBene]
	ON [dbo].[DO] ([Cd_DOAspBene])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_DOPorto]
	ON [dbo].[DO] ([Cd_DOPorto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_DOSped]
	ON [dbo].[DO] ([Cd_DOSped])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_DOTrasporto]
	ON [dbo].[DO] ([Cd_DOTrasporto])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_DOVettore_1]
	ON [dbo].[DO] ([Cd_DOVettore_1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_DOVettore_2]
	ON [dbo].[DO] ([Cd_DOVettore_2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_LS_1]
	ON [dbo].[DO] ([Cd_LS_1])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_LS_2]
	ON [dbo].[DO] ([Cd_LS_2])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_LS_C]
	ON [dbo].[DO] ([Cd_LS_C])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_MGCausale]
	ON [dbo].[DO] ([Cd_MGCausale])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Cd_RRConfig]
	ON [dbo].[DO] ([Cd_RRConfig])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DO_Descrizione]
	ON [dbo].[DO] ([Descrizione])
	ON [PRIMARY]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Aggiorna l''ultimo costo/prezzo per Arca Mobile Sales', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'AggiornaUltimoCosto_AM'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Causale contabile associata.
Impostabile solo per documenti di tipo fattura e fattura accompagnatoria.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_CGCausale'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del contatore utilizzato per la numerazione del documento.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_CN'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice dell''aspetto esteriore dei beni
Eventuale valore di default da proporre in automatico nel documento.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_DOAspBene'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice del porto.
Eventuale valore di default da proporre in automatico nel documento.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_DOPorto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice della modalità di spedizione.
Eventuale valore di default da proporre in automatico nel documento.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_DOSped'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice della causale trasporto
Eventuale valore di default da proporre in automatico nel documento.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_DOTrasporto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice primo vettore.
Eventuale valore di default da proporre in automatico nel documento.
Attenzione al fatto che anche a livello di cliente/fornitore si può specificare un codice vettore di default da proporre con priorità rispetto a questo campo.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_DOVettore_1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Codice secondo vettore.
Eventuale valore di default da proporre in automatico nel documento.
Non esiste campo corrispondente nell''anagrafica cliente/fornitore.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Cd_DOVettore_2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Documento Cliente o Fornitore ?
C = Documento Cliente.
F = Documento Fornitore.
Non è possibile la modifica del flag CliFor se esiste già un documento relativo a questo tipo di documento.
', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'CliFor'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Matricole: abilita la gestione del packing list per questo tipo documento', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'MtrEnabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Matricole: Format VFP del campo (!, R)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'MtrFormat'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Matricole: InputMask VFP del campo (####, XXXX/####)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'MtrInputMask'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Packing List: abilita la gestione del packing list per questo tipo documento', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'PkLstEnabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Packing List: Format VFP del campo (!, R)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'PkLstFormat'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Packing List: InputMask VFP del campo (####, XXXX/####)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'PkLstInputMask'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Packing List Mode: 1 per riga, 2 molti colli per 1 singola riga', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'PkLstMode'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se le promozioni vanno ricercate in base alla data di consegna e non alla data documento', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'PromozioniADataConsegna'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione per la % di provvigione (Es: 10 o 10+4 o 10+4-2)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Provvigione'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se il documento gestisce/Genera Retei/Risconti', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'RR_Enabled'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione per la % di sconto (Es: 10 o 10+4 o 10+4-2)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'Sconto'
GO
EXEC sp_addextendedproperty N'MS_Description', N'1/-1 se il documento deve rientrare nei flussi finanziari nella parte scadenze da Ordine/DDT', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'SegnoSCPrevista'
GO
EXEC sp_addextendedproperty N'MS_Description', N'P = Preventivo/Offerta, O = Ordine, B = Bolla, F = Fattura, A = Fattura Accompagnatoria, N = Nota Accredito, M = Reso Merce, D = Rapportino, G = Generico, L = Ordine Lavorazione, V = Carico da Produzione, T = Trasferimento Merce, R = Rettifica Inventario', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'TipoDocumento'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: controllo in tempo reale della disponibilità articolo in inserimento della quantità nelle righe documento', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkDisponibile'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: controllo in tempo reale della disponibilità immediata articolo in inserimento della quantità nelle righe documento', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkDisponibileImmediato'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: Controlla il fido concesso nella validazione del codice cliente.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFido'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: Non permettere l''emissione del documento se il cliente ha superato il fido concessogli.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFidoBlk'
GO
EXEC sp_addextendedproperty N'MS_Description', N'In caso di superamento del fido il documento verrà generato con stato non evadibile.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFidoBlkE'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: Considera la merce consegnata non ancora fatturata nel controllo del fido.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFidoBo'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: In caso di controllo del fido abilitato, rieseguire il controllo alla fine del documento prima di salvarlo.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFidoFin'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: Considera la merce ordinata non ancora consegnata nel controllo del fido.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFidoOc'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: In caso di controllo del fido abilitato, visualizza sempre la form con le informazioni, non solo quando il fido viene superato.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkFidoVis'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: controllo in tempo reale della giacenza articolo in inserimento della quantità nelle righe documento.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIChkGiacenza'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Flag relativo solo all''interfaccia: True per proporre data di trasporto nel piede ', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIPropDataOra'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Espressione utilizzata per comporre la riga di riferimento nel prelievo del modulo. Se RigaRifGenere è True allora il campo è obbligatorio.', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIRigaRifExp'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True se deve essere generata una riga descrittiva di riferimento al documento prelevato (se True allora RigaRifExp non può essere vuota o NULL).', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIRigaRifGenera'
GO
EXEC sp_addextendedproperty N'MS_Description', N'True per non riportare nel documento i riferimenti del documento prelevato dal documento prelevato (Es.: Ord -> Bolla -> Fatt.)', 'SCHEMA', N'dbo', 'TABLE', N'DO', 'COLUMN', N'UIRigaRifPreleva'
GO
EXEC sp_addextendedproperty N'Axp_Description', N'900521', 'SCHEMA', N'dbo', 'TABLE', N'DO', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Tipi documento', 'SCHEMA', N'dbo', 'TABLE', N'DO', NULL, NULL
GO
GRANT SELECT
	ON [dbo].[DO]
	TO [public]
GO
ALTER TABLE [dbo].[DO] SET (LOCK_ESCALATION = TABLE)
GO
