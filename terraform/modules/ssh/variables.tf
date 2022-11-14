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
# The local directory where the SSH key files are stored
#
variable "ssh_key_localpath" {
  type = string
  default = "../credentials"
}

#
# The local private SSH key file name 
#
variable "ssh_key_filename" {
  type = string
}

#
# AWS EC2 key-pair name
#
variable "keyname" {
  type = string
  default = "dse-sshkey"
}
