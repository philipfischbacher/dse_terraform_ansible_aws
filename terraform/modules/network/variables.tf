#
# AWS resource tag identifier
#
variable "tag_identifier" {
  type = string
  default = "phil-YJ-test"
}

#
# Environment description
#
variable "env" {
  type = string
  default = "phil-YJ-test"
}

#
# CIDR for VPC and subnets
#
variable "vpc_cidr" {
  type = string
  default = "191.100.0.0/16"
}

