# azure-furyagent

This module is useful to create all the things necessary for `furyagent` to work and to be provisioned.

## Providers

| Name   | Version |
| ----   | ------- |
| azure  | n/a     |

## Inputs

| Name                  | Description                                   | Type         | Default       | Required |
| --------------------- | --------------------------------------------- | ------------ | ------------- | :------: |
| furyagent_storage_account_name | Name of the Storage Account to create                  | `string`     | n/a           |   yes    |
| resource_group_name | Name of the Resource Group where the Storage Account will be created. It must already exist.                  | `string`     | n/a           |   yes    |
| tags                  | Custom tags to apply to resources             | `map(string)`| `{}`          |    no    |

## Outputs

| Name                      | Description                                                      |
| ------------------------- | ---------------------------------------------------------------- |
| furyagent                 | Furyagent configuration                                          |
| furyagent_ansible_secrets | Ansible variable file containing Azure credentials and Storage Account name |

## Usage

```hcl
module "azure-furyagent" {
  source                  = "path/to/this/azure-furyagent"
  furyagent_storage_account_name   = "sighup-backup"
  resource_group_name = "fury-rg"
  tags                    = {
      "cluster" : "sighup",
      "env"     : "production",
      "any-key" : "any-value"
  }
}
```

## License

For license details, please see [LICENSE](../../LICENSE)
