#!/bin/bash
notificationRelease=$(curl --header "PRIVATE-TOKEN:XXXXXX-XX" "http://gitlab.com.br/api/v4/projects/xxxx/repository/tags/rel_tag_11.0.999" | gawk 'match($0, /"release":{"tag_name":"([^"]*)","description":"([^}]*)"/, a) {print "<h1>"a[1]"</h1><br/>"a[2]}')
#example for replaces | gawk 'match($0, /"release":{"tag_name":"([^"]*)","description":"([^}]*)"/, a) {printf "<h1>"a[1]"</h1><br/>"a[2]}' | gawk '{gsub(/\\r\\n/,"\n")}1' | gawk '{gsub(/\047|\042|\\/,"")}1'
curl https://example.webhook.office.com/webhookb2/xxxxxxxxxxxxx/JenkinsCI/yyyyyyyyyyyyyyy/zzzzzzzz -H 'Content-Type: application/json' -d "{\"text\":\"$notificationRelease\"}"
