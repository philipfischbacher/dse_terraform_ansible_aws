# 
# SSH key used to access the EC2 instances
#
resource "aws_key_pair" "dse_terra_ssh" {
  key_name   = format("%s-%s", var.tag_identifier, var.keyname)
  public_key = file(format("%s/%s", var.ssh_key_localpath, var.ssh_key_filename))

  tags = {
    Name        = "${var.tag_identifier}-dse_ssh"
    Environment = var.env
 }
}
