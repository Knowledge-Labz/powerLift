$credential = Get-Credential -UserName simon.voyer@collecto.ca -Message "Password?"
$thisconn = Connect-PnPOnline -Credentials $credential -Url https://collecto.sharepoint.com -ReturnConnection
New-PnPSite -Type CommunicationSite -Title "HubHubby" -Url "https://collecto.sharepoint.com/sites/hubhubby" -Lcid 1036 -Connection $thisconn
Register-PnPHubSite -Connection $thisconn -Site "https://collecto.sharepoint.com/sites/hubhubby"

New-PnPSite -Type TeamSite -Title "TS11" -Alias "ts11" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type TeamSite -Title "TS21" -Alias "ts21" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type TeamSite -Title "TS31" -Alias "ts31" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type TeamSite -Title "TS41" -Alias "ts41" -Lcid 1036 -Connection $thisconn


New-PnPSite -Type CommunicationSite -Title "CS11" -Url "https://collecto.sharepoint.com/sites/cs11" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type CommunicationSite -Title "CS21" -Url "https://collecto.sharepoint.com/sites/cs21" -Lcid 1036 -Connection $thisconn

Disconnect-PnPOnline -Connection $thisconn


Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts11" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline

Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts21" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline

Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts31" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline

Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts41" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline
