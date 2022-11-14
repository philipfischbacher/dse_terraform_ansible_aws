terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region
  profile = "ec2"
}

#
# Modules
#

module "network" {
  source = "./modules/network"
  tag_identifier = var.tag_identifier
  env = var.env
}

module "ssh" {
  source = "./modules/ssh"
  tag_identifier = var.tag_identifier
  env = var.env
  ssh_key_filename = var.ssh_key_filename
}

module "security_group" {
  source = "./modules/security_group"
  tag_identifier = var.tag_identifier
  env = var.env
  vpc_id = module.network.vpc_1_id
}

#module "iam" {
  #source = "./modules/iam"
#}

module "ec2" {
  source = "./modules/ec2"
  tag_identifier = var.tag_identifier
  env = var.env
  subnet_id = module.network.subnet_1_id
  sg_ids = module.security_group.sg_ids
  dse_nodes = var.dse_nodes
  opsc_nodes = var.opsc_nodes
  ssh_keys = module.ssh.ssh_keys
  #instance_role_id = module.iam.instance_role_id
  ami_id = var.ami_id
}

module "ansible" {
  source = "./modules/ansible"
  tag_identifier = var.tag_identifier
  env = var.env
  instances = module.ec2.instances
  tokens = var.tokens
  racks_per_dc = var.racks_per_dc
  ansible_user = var.ansible_user
}

