output "sg_ids" {
  value       = {
    "internal" = aws_security_group.sg_internal.id,
    "ssh" = aws_security_group.sg_ssh.id,
    "opsc_web" = aws_security_group.sg_opsc_web.id,
    "opsc_node" = aws_security_group.sg_opsc_node.id,
    "grafana_web" = aws_security_group.sg_grafana_web.id,
    "dse_node" = aws_security_group.sg_dse_node.id
  }
  description = "Security Groups IDs"
}
