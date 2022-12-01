
#
# EC2 instances for DSE cluster
# 
resource "aws_instance" "dse" {
  ami                  = var.ami_id
  instance_type        = var.dse_instance_type
  count                = var.dse_nodes
  key_name             = var.ssh_keys.dse
  subnet_id            = var.subnet_id
  ebs_optimized        = true
  #iam_instance_profile = var.instance_role_id

  ebs_block_device {
    device_name = "/dev/xvdf"
    volume_type = "gp3"
    volume_size = "100"
  }

  vpc_security_group_ids = [
    var.sg_ids.internal,
    var.sg_ids.ssh,
    var.sg_ids.dse_node
  ]

  tags = {
    Name        = "${var.tag_identifier}-vm-dse-${count.index}"
    Environment = var.env
  }

  user_data = file("${path.root}/scripts/mount.sh")
}

#
# EC2 instances for OpsCenter server
#
resource "aws_instance" "opsc" {
  ami                  = var.ami_id
  instance_type        = var.opsc_instance_type
  count                = var.opsc_nodes
  key_name             = var.ssh_keys.dse
  subnet_id            = var.subnet_id
  ebs_optimized        = true
  #iam_instance_profile = var.instance_role_id

  ebs_block_device {
    device_name = "/dev/xvdf"
    volume_type = "gp3"
    volume_size = "100"
  }

  vpc_security_group_ids = [
    var.sg_ids.internal,
    var.sg_ids.ssh,
    var.sg_ids.opsc_web,
    var.sg_ids.opsc_node,
    var.sg_ids.grafana_web
  ]

  tags = {
    Name        = "${var.tag_identifier}-vm-opsc-${count.index}"
    Environment = var.env
  }

  user_data = file("${path.root}/scripts/mount.sh")
}

#
# EC2 instance to run tests from 
#
resource "aws_instance" "tester" {
  ami                  = var.ami_id
  instance_type        = var.tester_instance_type
  count                = 1
  key_name             = var.ssh_keys.dse
  subnet_id            = var.subnet_id
  ebs_optimized        = true
  #iam_instance_profile = var.instance_role_id

  ebs_block_device {
    device_name = "/dev/xvdf"
    volume_type = "gp3"
    volume_size = "100"
  }

  vpc_security_group_ids = [
    var.sg_ids.internal,
    var.sg_ids.dse_node,
    var.sg_ids.ssh,
  ]

  tags = {
    Name        = "${var.tag_identifier}-vm-tester"
    Environment = var.env
  }

  user_data = file("${path.root}/scripts/mount.sh")
}
