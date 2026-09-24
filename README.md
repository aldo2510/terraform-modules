# Terraform Modules

Reusable and governed Terraform modules for the AI-driven Infrastructure as Code laboratory.

## Modules

- `azure-storage-account` — Azure Storage Account with secure defaults.
- More modules will be added as the lab evolves.

## Design principles

- Secure defaults
- Explicit inputs and outputs
- Small composable modules
- No credentials in source
- Versioned changes through pull requests
- CI validation before merge

## Example

```hcl
module "storage" {
  source = "git::https://github.com/aldo2510/terraform-modules.git//modules/azure-storage-account?ref=main"

  name                = "stappdev01"
  resource_group_name = "rg-platform-dev"
  location            = "eastus"
  environment         = "dev"
  account_replication_type = "LRS"
}
```
