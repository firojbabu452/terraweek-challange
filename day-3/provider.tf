provider "aws" {
  region = var.aws_region
}



# Second provider (Bonus)

provider "aws" {
  alias  = "dr_region"
  region = var.dr_region
}