#
# SSH Keys
#

output "ssh_keys" {
  value       = {
    "dse" = aws_key_pair.dse_terra_ssh.key_name,
    "opsc" = aws_key_pair.dse_terra_ssh.key_name
  }
  description = "SSH keys"
}
