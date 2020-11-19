$credential = Get-Credential -UserName {{ username }} -Message "Password?"
$thisconn = Connect-PnPOnline -Credentials $credential -Url {{ mainsite_url }} -ReturnConnection
New-PnPSite -Type CommunicationSite -Title "{{ hub_name }}" -Url "{{ mainsite_url }}/sites/{{ hub_name.lower() }}" -Lcid 1036 -Connection $thisconn
Register-PnPHubSite -Connection $thisconn -Site "{{ mainsite_url }}/sites/{{ hub_name.lower() }}"
{% for teams_site in teams_sites %}
New-PnPSite -Type TeamSite -Title "{{ teams_site }}" -Alias "{{ teams_site.lower() }}" -Lcid 1036 -Connection $thisconn
{% endfor %}
{% for comms_site in comms_sites %}
New-PnPSite -Type CommunicationSite -Title "{{ comms_site }}" -Url "{{ mainsite_url }}/sites/{{ comms_site.lower() }}" -Lcid 1036 -Connection $thisconn
{% endfor %}
Disconnect-PnPOnline -Connection $thisconn

{% for teams_site in teams_sites %}
Connect-PnPOnline -Url "{{ mainsite_url }}/teams/{{ teams_site.lower() }}" -UseWebLogin
Add-PnPTeamsTeam
Disconnect-PnPOnline
{% endfor %}