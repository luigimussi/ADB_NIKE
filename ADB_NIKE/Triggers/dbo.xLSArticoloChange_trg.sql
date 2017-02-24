SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create Trigger xLSArticoloChange_trg On xLSArticoloChange For Insert, Update As
Begin
	If (Select Count(*) From Deleted) = 0
		-- Insert
		Update xLSArticoloChange Set 
		  --DataMov = dbo.afn_Datetime2Date    (Inserted.DataMov),
		  --Sconto	= dbo.afn_PercStrNormalize (Inserted.Sconto ),
			UserIns	= dbo.afn_GetUserInfo(),
			UserUpd	= dbo.afn_GetUserInfo(),
			TimeIns	= Getdate(),
			TimeUpd	= Getdate()
		From xLSArticoloChange Join Inserted On xLSArticoloChange.Id_xLSArticoloChange = Inserted.Id_xLSArticoloChange
	Else
		-- Update
		Update xLSArticoloChange Set 
		  --DataMov = dbo.afn_Datetime2Date    (Inserted.DataMov),
		  --Sconto	= dbo.afn_PercStrNormalize (Inserted.Sconto ),
			UserUpd = dbo.afn_GetUserInfo(),
			TimeUpd = Getdate()
		From xLSArticoloChange Join Inserted On xLSArticoloChange.Id_xLSArticoloChange = Inserted.Id_xLSArticoloChange
End
GO
