variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "staging_cidr" {
  description = "CIDR block for the staging environment"
  type        = string
}

variable "production_cidr" {
  description = "CIDR block for the production environment"
  type        = string
}

variable "staging_az" {
  description = "Availability zone for staging"
  type        = string
}

variable "production_az" {
  description = "Availability zone for production"
  type        = string
}
