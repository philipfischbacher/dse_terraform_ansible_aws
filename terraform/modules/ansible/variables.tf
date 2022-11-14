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
# Instances
#
variable "instances" {
  type = object({
    dse  = any
    opsc = any
  })
}

#
# Number of tokens
#
variable "tokens" {
  type = number
}

#
# Racks Per Dc
#
variable "racks_per_dc" {
  type = number
}

#
# Username for Ansible
#
variable "ansible_user" {
  type = string
}
