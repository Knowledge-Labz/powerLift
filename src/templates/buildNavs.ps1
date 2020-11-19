$credential = Get-Credential -UserName {{ username }} -Message "Password?"
$hubconn = Connect-PnPOnline -Credentials $credential -Url "{{ mainsite_url }}/sites/{{ hub_name.lower() }}" -ReturnConnection
Get-PnPNavigationNode -Location "TopNavigationBar" | Remove-PnPNavigationNode -Force -Connection $hubconn
{% for teams_site in teams_sites %}
Add-PnPNavigationNode -Location "TopNavigationBar" -Title "{{ teams_site }}" -Url "{{ mainsite_url }}/teams/{{ teams_site.lower() }}" -External -Connection $hubconn
{% endfor %}
{% for comms_site in comms_sites %}
Add-PnPNavigationNode -Location "TopNavigationBar" -Title "{{ comms_site }}" -Url "{{ mainsite_url }}/sites/{{ comms_site.lower() }}" -External -Connection $hubconn
{% endfor %}
{% for teams_site in teams_sites %}
Add-PnPHubSiteAssociation -Site "{{ mainsite_url }}/teams/{{ teams_site.lower() }}" -HubSite "{{ mainsite_url }}/sites/{{ hub_name.lower() }}" -Connection $hubconn
{% endfor %}
{% for comms_site in comms_sites %}
Add-PnPHubSiteAssociation -Site "{{ mainsite_url }}/sites/{{ comms_site.lower() }}" -HubSite "{{ mainsite_url }}/sites/{{ hub_name.lower() }}" -Connection $hubconn
{% endfor %}
Disconnect-PnPOnline -Connection $hubconn