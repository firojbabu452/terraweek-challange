variable "aws_region" {
  description = "Primary region to deploy the stack into"
  type        = string
  default     = "ap-south-1" # Mumbai
}

variable "dr_region" {
  description = "Secondary region used only by the aliased provider (Bonus, Task 1)"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used to tag/name every resource"
  type        = string
  default     = "terraweek-day3"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "t2.micro/t3.micro are free-tier eligible in most regions"
  type        = string
  default     = "t2.micro"
}

############################################
# Task 4: meta-argument inputs
############################################

variable "instance_count" {
  description = "How many identical instances `count` creates (Task 4)"
  type        = number
  default     = 2
}

variable "instance_names" {
  description = <<-EOT
    Named instances created with `for_each` (Task 4). A map gives each
    instance a STABLE identity (the key). Deleting "jobs" destroys only
    that one instance - unlike `count`, where removing an item mid-list
    reindexes and can force unrelated replacements.
  EOT
  type = map(string)
  default = {
    "web"  = "frontend"
    "api"  = "backend"
    "jobs" = "worker"
  }
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH - lock this to YOUR IP in real use"
  type        = string
  default     = "0.0.0.0/0" # convenience default for the exercise only
}