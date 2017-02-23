SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE Trigger [dbo].[xUpdatedTriggerName] On [dbo].[LSArticolo]
For Update
As
	------------------------------------------------------------------------------------------------------------
	-- Il corpo del trigger viene saltato nel caso in cui sia richiesto di non eseguire i trigger mediante 
	-- l'invocazione della stored procedure asp_TrgSkipOn()
	------------------------------------------------------------------------------------------------------------
	Set Xact_Abort On
	Set NoCount On

	If (dbo.afn_TrgSkipIsOn() > 0) Goto lblTriggerSkipped


	If Exists(
			Select *
				From INSERTED I
					Inner Join DELETED D On D.ID_LSArticolo = I.ID_LSArticolo And D.Prezzo <> I.Prezzo
			)
	Begin
		Declare @prezzoNew Numeric(18, 6)
		Declare @prezzoOld Numeric(18, 6)
		Declare @Id_LSArticolo int
		Declare @Id_LSRevisione int
		Declare @Cd_AR varchar(20)

		Declare crInserted Cursor Local Forward_Only 
		For Select Id_LSArticolo From INSERTED 
		Open crInserted;
		Fetch Next From crInserted Into @Id_LSArticolo	
		While @@FETCH_STATUS = 0
		Begin
			Set @prezzoOld      = (Select Prezzo From Deleted Where Deleted.Id_LSArticolo = @Id_LSArticolo)
			Set @prezzoNew      = (Select Prezzo From Inserted Where Inserted.Id_LSArticolo = @Id_LSArticolo)
			Set @Id_LSRevisione = (Select Id_LSRevisione From INSERTED Where Inserted.Id_LSArticolo = @Id_LSArticolo)
			Set @Cd_AR          = (Select Cd_AR From INSERTED Where Inserted.Id_LSArticolo = @Id_LSArticolo)
			
			Insert Into xLSArticoloChange
				(UserChange
				, Id_LSArticolo
				, Id_LSRevisione
				, Cd_AR
				, PrezzoOld
				, PrezzoNew
				)
				Values
				(dbo.afn_GetUserInfo()
				, @Id_LSArticolo
				, @ID_LSRevisione
				, @Cd_AR
				, @prezzoOld
				, @prezzoNew
				)

			Fetch Next From crInserted Into @Id_LSArticolo	
		End
		Close crInserted;
		Deallocate crInserted

	End


	lblTriggerSkipped:
GO
