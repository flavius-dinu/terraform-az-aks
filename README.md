# Azure AKS Module
## Workflows
In this repository there are 3 github actions workflows:
- **auto_tag.yaml**
    - this workflow will run whenever a merge to the main branch occurs
    - it will by default tag your repository with a Patch bump (version format is: vMajor.Minor.Patch)
    - if you want to bump the major or the minor version of the repository, you will simply have to start your commit with #major or #minor
- **pre_commit.yaml**
    - this workflow will run on every push in order to check: tflint, tf-docs, validate, fmt, end-of-file fixer and trailing whitspace fixes and whatever else you decide to add to the .pre-commit-config.yaml file
- **terraform.yaml**
    - this workflow can be run manually based on an operation you provide (plan, apply, destroy)
    - it is recommended to use remote state in order to take advantage of this

## Installing pre-commit locally
In order to make sure that you are writing code that respects industry standards, you will need to install:
- [pre-commit](https://pre-commit.com)
- [tf-docs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)

After you install all of these, you can go to the root directory of the repository and run:

`pre-commit run --all-files`

This will fix all the problems related to the hooks mentioned above.

## Module
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.15.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.38.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [local_file.kube_config](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kube_params"></a> [kube\_params](#input\_kube\_params) | AKS params | <pre>map(object({<br>    name                = string<br>    rg_name             = string<br>    rg_location         = string<br>    dns_prefix          = string<br>    client_id           = optional(string, null)<br>    client_secret       = optional(string, null)<br>    vm_size             = optional(string, "Standard_DS2_v2")<br>    enable_auto_scaling = optional(string, true)<br>    max_count           = optional(number, 1)<br>    min_count           = optional(number, 1)<br>    node_count          = optional(number, 1)<br>    np_name             = string<br>    service_principal = optional(list(object({<br>      client_id     = optional(string, null)<br>      client_secret = optional(string, null)<br>    })), [])<br>    identity = optional(list(object({<br>      type         = optional(string, "SystemAssigned")<br>      identity_ids = optional(list(string), [])<br>    })), [])<br>    kubeconfig_path = optional(string, "~./kube/config")<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_kube_config_path"></a> [kube\_config\_path](#output\_kube\_config\_path) | n/a |
| <a name="output_kube_params"></a> [kube\_params](#output\_kube\_params) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
