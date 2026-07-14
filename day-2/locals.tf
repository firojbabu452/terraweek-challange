locals {

  # For Expression
  uppercase_names = [
    for name in var.names : upper(name)
  ]

  # Conditional Expression
  instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"

}