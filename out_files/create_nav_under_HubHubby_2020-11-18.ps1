$credential = Get-Credential -UserName simon.voyer@collecto.ca -Message "Password?"
$hubconn = Connect-PnPOnline -Credentials $credential -Url "https://collecto.sharepoint.com/sites/hubhubbar" -ReturnConnection
Get-PnPNavigationNode -Location "TopNavigationBar" | Remove-PnPNavigationNode -Force -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS11" -Url "https://collecto.sharepoint.com/teams/ts11" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS21" -Url "https://collecto.sharepoint.com/teams/ts21" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS31" -Url "https://collecto.sharepoint.com/teams/ts31" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS41" -Url "https://collecto.sharepoint.com/teams/ts41" -External -Connection $hubconn


Add-PnPNavigationNode -Location "TopNavigationBar" -Title "CS11" -Url "https://collecto.sharepoint.com/sites/cs11" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "CS21" -Url "https://collecto.sharepoint.com/sites/cs21" -External -Connection $hubconn


Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts11" -HubSite "https://collecto.sharepoint.com/sites/hubhubbar" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts21" -HubSite "https://collecto.sharepoint.com/sites/hubhubbar" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts31" -HubSite "https://collecto.sharepoint.com/sites/hubhubbar" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts41" -HubSite "https://collecto.sharepoint.com/sites/hubhubbar" -Connection $hubconn


Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/sites/cs11" -HubSite "https://collecto.sharepoint.com/sites/hubhubbar" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/sites/cs21" -HubSite "https://collecto.sharepoint.com/sites/hubhubbar" -Connection $hubconn

Disconnect-PnPOnline -Connection $hubconn