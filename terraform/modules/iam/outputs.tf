output "instance_role_id" {
  value       = aws_iam_instance_profile.instance_role.id
  description = "ID of the AWS VPC."
}
