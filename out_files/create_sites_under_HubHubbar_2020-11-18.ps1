$credential = Get-Credential -UserName simon.voyer@collecto.ca -Message "Password?"
$thisconn = Connect-PnPOnline -Credentials $credential -Url https://collecto.sharepoint.com -ReturnConnection
New-PnPSite -Type CommunicationSite -Title "HubHubbar" -Url "https://collecto.sharepoint.com/sites/hubhubbar" -Lcid 1036 -Connection $thisconn
Register-PnPHubSite -Connection $thisconn -Site "https://collecto.sharepoint.com/sites/hubhubbar"

New-PnPSite -Type TeamSite -Title "TS111" -Alias "ts111" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type TeamSite -Title "TS211" -Alias "ts211" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type TeamSite -Title "TS311" -Alias "ts311" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type TeamSite -Title "TS411" -Alias "ts411" -Lcid 1036 -Connection $thisconn


New-PnPSite -Type CommunicationSite -Title "CS111" -Url "https://collecto.sharepoint.com/sites/cs111" -Lcid 1036 -Connection $thisconn

New-PnPSite -Type CommunicationSite -Title "CS211" -Url "https://collecto.sharepoint.com/sites/cs211" -Lcid 1036 -Connection $thisconn

Disconnect-PnPOnline -Connection $thisconn


Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts111" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline

Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts211" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline

Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts311" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline

Connect-PnPOnline -Url "https://collecto.sharepoint.com/teams/ts411" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline
