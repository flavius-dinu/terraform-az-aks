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
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kube_params"></a> [kube\_params](#input\_kube\_params) | name                = string<br>rg\_name             = string<br>rg\_location         = string<br>dns\_prefix          = string<br>client\_id           = string<br>client\_secret       = string<br>vm\_size             = string<br>enable\_auto\_scaling = string<br>max\_count           = number<br>min\_count           = number<br>node\_count          = number<br>np\_name             = string<br>service\_principal   = list(object({<br>  client\_id     = string<br>  client\_secret = string<br>}))<br>identity            = list(object({<br>  type         = string<br>  identity\_ids = list(string)<br>})) | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Global tags to apply to the resources. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_params"></a> [kube\_params](#output\_kube\_params) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
```
