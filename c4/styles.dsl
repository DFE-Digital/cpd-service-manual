
element "Person" {
  shape Person
}

element "Software System" {
  background #1168bd
  color #ffffff
  shape RoundedBox
}

element "Datastore" {
  shape Cylinder
}

element "Blobstore" {
  shape Folder
}

element "Component" {
  background #85bbf0
  color #000000
  shape Box
}

element "Deployment Node" {
  border Dotted
}

relationship "Relationship" {
  thickness 5
  routing Direct
  dashed false
}
