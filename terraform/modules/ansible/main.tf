#
# Generation of Ansible inventory
#
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.root}/templates/hosts.tftpl",
    {
      opsc              = var.instances.opsc.0
      tester            = var.instances.tester.0
      analytics_dc      = length(var.instances.dse.*) >= 3 ? slice(var.instances.dse.*, 0, 3) : []
      transactional_dc  = length(var.instances.dse.*) > 3 ? slice(var.instances.dse.*, 3, length(var.instances.dse.*)) : []
      tokens            = var.tokens
      ansible_user      = var.ansible_user
      racks_per_dc      = var.racks_per_dc
    }
  )
 filename = format("%s/%s", "${path.root}/ansible/", "hosts")
}
