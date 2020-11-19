$credential = Get-Credential -UserName simon.voyer@collecto.ca -Message "Password?"
$hubconn = Connect-PnPOnline -Credentials $credential -Url "https://collecto.sharepoint.com/sites/hubhubby" -ReturnConnection
Get-PnPNavigationNode -Location "TopNavigationBar" | Remove-PnPNavigationNode -Force -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS111" -Url "https://collecto.sharepoint.com/teams/ts111" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS211" -Url "https://collecto.sharepoint.com/teams/ts211" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS311" -Url "https://collecto.sharepoint.com/teams/ts311" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "TS411" -Url "https://collecto.sharepoint.com/teams/ts411" -External -Connection $hubconn


Add-PnPNavigationNode -Location "TopNavigationBar" -Title "CS111" -Url "https://collecto.sharepoint.com/sites/cs111" -External -Connection $hubconn

Add-PnPNavigationNode -Location "TopNavigationBar" -Title "CS211" -Url "https://collecto.sharepoint.com/sites/cs211" -External -Connection $hubconn


Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts111" -HubSite "https://collecto.sharepoint.com/sites/hubhubby" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts211" -HubSite "https://collecto.sharepoint.com/sites/hubhubby" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts311" -HubSite "https://collecto.sharepoint.com/sites/hubhubby" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/teams/ts411" -HubSite "https://collecto.sharepoint.com/sites/hubhubby" -Connection $hubconn


Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/sites/cs111" -HubSite "https://collecto.sharepoint.com/sites/hubhubby" -Connection $hubconn

Add-PnPHubSiteAssociation -Site "https://collecto.sharepoint.com/sites/cs211" -HubSite "https://collecto.sharepoint.com/sites/hubhubby" -Connection $hubconn

Disconnect-PnPOnline -Connection $hubconn