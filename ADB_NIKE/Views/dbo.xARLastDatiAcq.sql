SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

Create View xARLastDatiAcq With SchemaBinding
As

       Select
               AR.Cd_AR
			 , DORig.PrezzoUnitarioV
             , DORig.Cd_Aliquota
       From dbo.AR
             Inner Join dbo.DORig On DORig.Id_DORig = (Select Top 1 R.Id_DORig From dbo.DORig R Inner Join dbo.DOTes T On T.Id_DOTes = R.Id_DOTes Where T.Cd_DO IN ('FAF', 'FF') And R.Cd_Aliquota Is Not Null And R.Cd_AR = AR.Cd_AR Order By T.DataDoc Desc)

GO
GRANT SELECT
	ON [dbo].[xARLastDatiAcq]
	TO [public]
GO
