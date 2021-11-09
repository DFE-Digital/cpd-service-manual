dqt = softwareSystem "Database of Qualified Teachers" "" "Dynamics365" {
  api = container "API" "" "EAPIM" {
    qualified_teachers = component "Qualified teachers API" "" "Restful JSON API"
  }
}
