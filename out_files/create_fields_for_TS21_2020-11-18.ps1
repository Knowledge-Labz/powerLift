$credential = Get-Credential -UserName simon.voyer@collecto.ca -Message "Password?"
$siteconn = Connect-PnPOnline -Credentials $credential -Url "https://collecto.sharepoint.com/teams/hubhubbar" -ReturnConnection


Add-PnPField -List "Documents" -DisplayName "Confirmation de signature" -InternalName "signed_confirmed" -Type "Boolean" -AddToDefaultView

Add-PnPField -List "Documents" -DisplayName "Date de signature" -InternalName "signed_confirmed_date" -Type "DateTime" -AddToDefaultView

Add-PnPField -List "Documents" -DisplayName "Vendeur" -InternalName "assigned_salesperson" -Type "User" -AddToDefaultView
