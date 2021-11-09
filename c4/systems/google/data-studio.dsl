data_studio = softwareSystem "Data Studio" {
  dashboards = container "Dashboards" {
    ecf_schools = component "ECF School onboarding"
    ecf_partnerships = component "ECF Lead Provider partnerships"
    ecf_validations = component "ECF TRN Validations"
    ecf_declarations = component "ECF Lead Provider declarations"

    npq_validations = component "NPQ TRN Validations"
    npq_declarations = component "NPQ Lead Provider declarations"
  }
}
