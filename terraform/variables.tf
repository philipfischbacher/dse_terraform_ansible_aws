#
# AWS resource tag identifier
#
variable "tag_identifier" {
  type = string
  default = "YJ-test"
}

#
# Environment description
#
variable "env" {
  type = string
  default = "YJ-test"
}

#
# Default AWS region
#
variable "region" {
  type = string
  default = "us-west-2"
}

#
# Number of DSE Nodes
#
variable "dse_nodes" {
  type = number
  default = 3
}

#
# Number of tokens
#
variable "tokens" {
  type = number
  default = 128
}

#
# Racks Per Dc
#
variable "racks_per_dc" {
  type = number
  default = 3
}

#
# Username for Ansible
#
variable "ansible_user" {
  type = string
  default = "ec2-user"
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

#
# Number of OpsCenter Nodes
#
variable "opsc_nodes" {
  default = 1
}

#
# Default OS image: Ubuntu
#
variable "ami_id" {
  // amazon linux
  // ap-northeast-1
  default = "ami-0f36dcfcc94112ea1"
  // us-west-2
  //default = "ami-0e21d4d9303512b8e"
}

#
# The local private SSH key file name 
#
variable "ssh_key_filename" {
  type = string
}
