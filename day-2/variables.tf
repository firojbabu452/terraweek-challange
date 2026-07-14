variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be either dev or prod."
  }
}

variable "container_name" {
  type = string
}

variable "external_port" {
  type = number
}

variable "names" {
  description = "List of team members"
  type        = list(string)

  default = [
    "firoj",
    "babu",
    "devops"
  ]
}

variable "container_config" {
  description = "Optional container configuration"

  type = object({
    image         = optional(string, "nginx:latest")
    internal_port = optional(number, 80)
    restart       = optional(string, "unless-stopped")
  })

  default = {}
}