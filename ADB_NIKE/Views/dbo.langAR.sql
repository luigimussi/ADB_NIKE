SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[langAR]
As
/*
	Set Language 'spanish';		Select Cd_AR, Descrizione, WebDescrizione from langAR
	Set Language 'italiano';	Select Cd_AR, Descrizione, WebDescrizione from langAR
	Set Language 'english';		Select Cd_AR, Descrizione, WebDescrizione from langAR
*/	

-- Tutte le colonne di AR + tre nuove colonne langDescrizione, langWebDescrizione, langWebNote_AR     

Select 
	A.*,
	langDescrizione    = IsNull(L.Descrizione,      A.Descrizione   ), 
	langWebDescrizione = IsNull(L.WebDescrizione,   A.WebDescrizione), 
	langWebNote_AR     = IsNull(L.WebNote_ARLingua, A.WebNote_AR    )
From
	AR A
	Left Join ARLingua L On A.Cd_AR = L.Cd_AR And L.Id_Lingua = dbo.afn_userLCID()
GO
GRANT SELECT
	ON [dbo].[langAR]
	TO [public]
GO
