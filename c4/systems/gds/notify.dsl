notify = softwareSystem "GOV UK Notify" {
  letters = container "Send Letters" "" "GDS Service"
  emails = container "Send Emails" "" "GDS Service"
  sms = container "Send SMS" "" "GDS Service"
}
