output "instances" {
  value       = {
    "dse" = aws_instance.dse.*,
    "opsc" = aws_instance.opsc.*,
  }
  description = "Instances"
}

