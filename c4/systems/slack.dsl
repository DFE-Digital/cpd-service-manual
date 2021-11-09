slack = softwareSystem "Slack" {
  dfe = container "Department for Education" "" "ukgovernmentdfe.slack.com" {
    alerts = component "cpd-dev-alerts" "" "Private channel"

    # Capita do not have access to slack
    # capita = component "cpd-provider-capita" "" "Private channel"

    ambition = component "cpd-provider-ambition" "" "Private channel"
    edt = component "cpd-provider-edt" "" "Private channel"
    teachfirst = component "cpd-provider-teachfirst" "" "Private channel"
    ucl = component "cpd-provider-ucl" "" "Private channel"

    coe = component "npq-provider-coe" "" "Private channel"
    llse = component "npq-provider-llse" "" "Private channel"
    sln = component "npq-provider-school-led-network" "" "Private channel"
    tdt = component "npq-provider-tdt" "" "Private channel"
  }
}
