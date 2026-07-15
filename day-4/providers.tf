
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = "terraweek-2026"
      ManagedBy = "terraform"
      Purpose   = "tf-state-backend"
    }
  }
}