$credential = Get-Credential -UserName {{ username }} -Message "Password?"
$siteconn = Connect-PnPOnline -Credentials $credential -Url "{{ site_url }}" -ReturnConnection

{% for list in site_lists %}{% for list_name, fields in list.items() %}{% for field_name, info in fields.items() %}
Add-PnPField -List "{{ list_name }}" -DisplayName "{{ info['display_name'] }}" -InternalName "{{ info['internal_name'] }}" -Type "{{ info['type'] }}" -AddToDefaultView
{% endfor %}{% endfor %}{% endfor %}