gias = softwareSystem "Get Information About Schools" "" "Dynamics365" {
  api = container "API" "" "SFTP Server" {
    schools_information = component "Get Information About Schools Data file" "" "CSV Extract"
  }
}
