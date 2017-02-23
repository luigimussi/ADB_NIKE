SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

Create View xARLastUbicazione With SchemaBinding
As
       Select
             AR.Cd_AR,
             DORig.Cd_MGUbicazione_A
       From dbo.AR
             Inner Join dbo.DORig On DORig.Id_DORig = (Select Top 1 R.Id_DORig From dbo.DORig R Inner Join dbo.DOTes T On T.Id_DOTes = R.Id_DOTes Where T.Cd_DO = 'VS1' And QtaEvadibile <> 0 And R.Cd_MGUbicazione_A Is Not Null And R.Cd_AR = AR.Cd_AR Order By T.DataDoc Desc)
GO
GRANT SELECT
	ON [dbo].[xARLastUbicazione]
	TO [public]
GO
