SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE View [dbo].[xvw_LSArticoloChange] 
As

Select *
  From xLSArticoloChange T1
 Where T1.dataChange = (
						Select MAX(dataChange)
						  From xLSArticoloChange T2
						 Where T1.Cd_AR = T2.Cd_AR
							   And T2.Id_LSRevisione = T1.Id_LSRevisione
					   )

GO
