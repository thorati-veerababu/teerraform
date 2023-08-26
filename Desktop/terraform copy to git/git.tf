terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 5.0"
    }
  }
}
provider "github" {
  
  token = var.token
}
  resource "github_repository" "terrafom-github_repository-1" {
  name        = "this-repo-created-by-using-terraform"
  description = "My awesome codebase"

  visibility = "public"

}
