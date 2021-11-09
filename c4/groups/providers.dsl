group "Providers" {
  # Systems
  lead_provider_portal = softwareSystem "Lead provider Portal"
  appropriate_body_system = softwareSystem "Appropriate body Portal"

  # Users
  lp = person "Lead provider" {
    -> lead_provider_portal "Uses"
  }

  dp = person "Delivery partner" {
    -> lead_provider_portal "Uses"
  }

  ab = person "Appropriate body" {
    -> appropriate_body_system "Uses"
    -> lead_provider_portal "Uses"
  }
}
