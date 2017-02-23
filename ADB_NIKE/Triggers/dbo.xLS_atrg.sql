SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
	Create Trigger dbo.xLS_atrg On dbo.LS  For Insert, Update, Delete As
	Begin
		If @@RowCount = 0 Or (dbo.afn_TrgSkipIsOn() > 0) Return

		Set Nocount On

		Declare	@InsExists Int,
					@DelExists Int,
					@TrgIsIns  Int,
					@TrgIsUpd  Int
					
		Select	@InsExists = Case When Exists(Select * From Inserted   ) Then 1 Else 0 End,
					@DelExists = Case When Exists(Select * From Deleted    ) Then 1 Else 0 End,
					@TrgIsIns  = Case When @InsExists = 1 And @DelExists = 0 Then 1 Else 0 End,
					@TrgIsUpd  = Case When @InsExists = 1 And @DelExists = 1 Then 1 Else 0 End
		
		If (@TrgIsUpd = 1 Or @TrgIsIns = 1) And 
			Exists(	Select Utente From(	Select Cd_LS, Utente = xUIShowInAR.List.value('@utente', 'varchar(max)')
													From LS Cross Apply xUIShowInAR.nodes('rows/row') AS xUIShowInAR(List) 
										 		) X
							Group By Utente Having COUNT(*) > 9 )
		Begin		
			Raiserror('È stato superato il limite di 9 listini visibili nella finestra di gestione degli articoli.', 16, 0)
			RollBack Transaction
			Return
		End
	End
GO
