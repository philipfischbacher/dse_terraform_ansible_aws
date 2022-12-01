output "instances" {
  value       = {
    "dse" = aws_instance.dse.*,
    "opsc" = aws_instance.opsc.*,
    "tester" = aws_instance.tester.*,
  }
  description = "Instances"
}

