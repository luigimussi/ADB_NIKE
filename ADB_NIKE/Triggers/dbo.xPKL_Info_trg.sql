SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create Trigger xPKL_Info_trg On xPKL_Info For Insert, Update As
Begin
	If (Select Count(*) From Deleted) = 0
		-- Insert
		Update xPKL_Info Set 
		  --DataMov = dbo.afn_Datetime2Date    (Inserted.DataMov),
		  --Sconto	= dbo.afn_PercStrNormalize (Inserted.Sconto ),
			UserIns	= dbo.afn_GetUserInfo(),
			UserUpd	= dbo.afn_GetUserInfo(),
			TimeIns	= Getdate(),
			TimeUpd	= Getdate()
		From xPKL_Info Join Inserted On xPKL_Info.Id_xPKL_Info = Inserted.Id_xPKL_Info
	Else
		-- Update
		Update xPKL_Info Set 
		  --DataMov = dbo.afn_Datetime2Date    (Inserted.DataMov),
		  --Sconto	= dbo.afn_PercStrNormalize (Inserted.Sconto ),
			UserUpd = dbo.afn_GetUserInfo(),
			TimeUpd = Getdate()
		From xPKL_Info Join Inserted On xPKL_Info.Id_xPKL_Info = Inserted.Id_xPKL_Info
End
GO
