#
# AWS resource tag identifier
#
variable "tag_identifier" {
  type = string
}

#
# Environment description
#
variable "env" {
  type = string
}

#
# Amazon Machine Image (AMI)
#
variable "ami_id" {
  type = string
}

#
# VPC subnet id
#
variable "subnet_id" {
  type = string
}

#
# DSE nodes
#
variable "dse_nodes" {
  type = number
}

#
# OpsCenter nodes
#
variable "opsc_nodes" {
  type = number
}

#
# Instance Type for DSE
#
variable "dse_instance_type" {
  type = string
  default = "m4.large"
}

#
# Instance Type for OpsCenter
#
variable "opsc_instance_type" {
  type = string
  default = "m4.large"
}


#variable "instance_role_id" {
#  type        = string
#  description = "AWS Instance role ID"
#}


variable "sg_ids" {
  type        = map
  description = "Security Groups IDs"
}

variable "ssh_keys" {
  type        = map
  description = "ssh keys"
}
