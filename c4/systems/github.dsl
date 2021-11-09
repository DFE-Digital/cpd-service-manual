github = softwareSystem "Github" {
  repositories = container "Git Repo"

  actions = container "Github Actions" {
    -> repositories "Pulls code changes from" "HTTPS/SSL TLS 1.2"
  }
}
