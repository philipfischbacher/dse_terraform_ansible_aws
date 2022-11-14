# NEED PERMISSIONS TO DO THIS FIRST!

#resource "aws_iam_instance_profile" "instance_role" {
#  name = "instance-role"
#  role = aws_iam_role.backup_role.id
#}
#
#resource "aws_iam_role" "backup_role" {
#  name = "backup_role"
#
#  assume_role_policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [
#      {
#        Action = "sts:AssumeRole"
#        Effect = "Allow"
#        Sid    = ""
#        Principal = {
#          Service = "ec2.amazonaws.com"
#        }
#      },
#    ]
#  })
#}
