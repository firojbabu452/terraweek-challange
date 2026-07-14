# TerraWeek Challenge – Day 2 🚀

## HCL Deep Dive: Variables, Types & Expressions

**Date:** 13 July 2026

## 📖 Overview

On Day 2 of the TerraWeek Challenge, I explored the fundamentals of **HashiCorp Configuration Language (HCL)**, the language used by Terraform to define infrastructure as code. The focus was on writing reusable, maintainable, and scalable Terraform configurations using variables, expressions, locals, outputs, and built-in functions.

---

# ✅ Learning Objectives Completed

* Understood the anatomy of HCL blocks and arguments.
* Learned the difference between blocks and arguments.
* Practiced Terraform expressions, references, and interpolation.
* Created variables using different data types.
* Added variable validation and sensitive variables.
* Used locals to compute reusable values.
* Created meaningful outputs.
* Explored Terraform built-in functions.
* Understood Terraform variable precedence.
* Built a real project using the Docker provider by provisioning an Nginx container.
* Implemented bonus features including **for expressions**, **conditional expressions**, and **optional() object attributes**.

---

# 📝 Task 1 – Mastering HCL Syntax

### Block Structure

```hcl
block_type "label_one" "label_two" {
  argument = value
}
```

Example:

```hcl
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
}
```

### Difference Between Block and Argument

**Block**

A block defines a Terraform object such as a resource, provider, variable, output, or local.

Example:

```hcl
resource "docker_image" "nginx" {
}
```

**Argument**

Arguments configure a block.

Example:

```hcl
name = "nginx:latest"
```

### Expressions

Used:

* String interpolation
* Resource references
* Arithmetic operators
* Comparison operators
* Logical operators

Examples:

```hcl
"${var.environment}-${var.container_name}"

docker_image.nginx.image_id

var.external_port + 100

var.environment == "prod"
```

---

# 📝 Task 2 – Variables, Types & Validation

Created **variables.tf** containing all major Terraform variable types.

### Primitive Types

* string
* number
* bool

### Collection Types

* list(string)
* map(string)
* set(string)

### Structural Types

* object({...})
* tuple([...])

### Additional Features

Implemented:

* Default values
* Validation blocks
* Sensitive variables

Example validation:

```hcl
variable "environment" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev","staging","prod"], var.environment)
    error_message = "Environment must be dev, staging or prod."
  }
}
```

Sensitive variable example:

```hcl
variable "docker_password" {
  type      = string
  sensitive = true
}
```

---

# 📝 Task 3 – Locals, Outputs & Functions

Used a **locals** block to generate reusable values.

Example:

```hcl
locals {
  name_prefix = "${var.environment}-${var.container_name}"
}
```

Created useful outputs including:

* Container Name
* Container ID
* Container URL
* Image Name

### Built-in Functions Used

* upper()
* join()
* merge()
* lookup()
* length()
* format()

Practiced using **terraform console**

```bash
terraform console
```

Examples:

```hcl
upper("terraweek")

merge({a=1},{b=2})

join("-",["tws","terraweek","2026"])
```

---

# 📝 Task 4 – Build Something Real

Created a Docker-based Terraform project using the **kreuzwerker/docker** provider.

The project provisions:

* Docker Image (Nginx)
* Docker Container
* Dynamic ports
* Environment-specific configuration
* Variables
* Outputs

Terraform workflow executed successfully:

```bash
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply

terraform output

terraform destroy
```

Also tested variable values using:

* `-var`
* `terraform.tfvars`

---

# 📊 Terraform Variable Precedence

Highest priority to lowest:

```
-var / -var-file
        ↓
*.auto.tfvars
        ↓
terraform.tfvars
        ↓
TF_VAR_ Environment Variables
        ↓
Default Variable Values
```

---

# 🍫 Bonus Tasks Completed

### ✅ For Expression

```hcl
[for name in var.names : upper(name)]
```

---

### ✅ Conditional Expression

```hcl
var.environment == "prod" ? "t3.medium" : "t3.micro"
```

---

### ✅ Optional Object Attributes

```hcl
variable "container_config" {
  type = object({
    image         = optional(string, "nginx:latest")
    internal_port = optional(number, 80)
    restart       = optional(string, "unless-stopped")
  })

  default = {}
}
```

---

# 🛠️ Technologies Used

* Terraform
* HCL (HashiCorp Configuration Language)
* Docker
* Nginx
* Terraform Docker Provider

---

# 📂 Project Structure

```
terraform-docker-nginx/
├── versions.tf
├── providers.tf
├── variables.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── dev.tfvars
├── prod.tfvars
└── README.md
```

---

# 🎯 Key Takeaways

* HCL is simple, readable, and highly reusable.
* Variables make infrastructure configurable across environments.
* Validation helps prevent configuration mistakes.
* Locals reduce code duplication.
* Outputs expose useful resource information.
* Built-in functions simplify data transformation.
* `terraform.tfvars` is cleaner than repeatedly passing `-var`.
* Terraform expressions enable dynamic infrastructure definitions.

---

## 🚀 TerraWeek Progress

* ✅ Day 1 — Terraform Basics
* ✅ Day 2 — HCL Deep Dive: Variables, Types & Expressions

Looking forward to continuing the TerraWeek Challenge and building more real-world Infrastructure as Code projects.
