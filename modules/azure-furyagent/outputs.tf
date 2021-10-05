output "furyagent" {
  description = "furyagent configuration"
  value       = local.furyagent
}

locals {
  furyagent = <<EOF
storage:
  provider: azure
  azure_storage_account: ${azurerm_storage_account.main.name}
  azure_storage_key: ${azurerm_storage_account.main.primary_access_key}
  bucketName: ${azurerm_storage_container.main.name}
clusterComponent:
  openvpn:
    certDir: ${path.root}
EOF

}

output "furyagent_ansible_secrets" {
  description = "furyagent ansible role variables"
  value       = local.furyagent_ansible_secrets
}

locals {
  furyagent_ansible_secrets = <<EOF
azure_storage_account: ${azurerm_storage_account.main.name}
azure_storage_key: ${azurerm_storage_account.main.primary_access_key}
azure_container_name: ${azurerm_storage_container.main.name}
EOF

}
