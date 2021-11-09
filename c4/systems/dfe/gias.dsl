gias = softwareSystem "Get information about schools" "" "Dynamics365" {
  api = container "API" "" "SFTP Server" {
    schools_information = component "Get information about schools Data file" "" "CSV Extract"
  }
}
