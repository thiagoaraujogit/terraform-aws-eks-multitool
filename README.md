# AWS EKS Cluster Multitool module

---

**Table of Contents**
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.62.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.62.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_iam_role.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_iam_policy_document.cluster_trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_public_access_allowed_cidrs"></a> [eks\_public\_access\_allowed\_cidrs](#input\_eks\_public\_access\_allowed\_cidrs) | List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled. | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_eks_subnet_ids"></a> [eks\_subnet\_ids](#input\_eks\_subnet\_ids) | List of Subnet IDs. Indicates in which VPC subnets the EKS cluster and it's nodes must be created. | `list(string)` | n/a | yes |
| <a name="input_enable_eks_private_access"></a> [enable\_eks\_private\_access](#input\_enable\_eks\_private\_access) | Whether the Amazon EKS private API server endpoint is enabled. | `bool` | `false` | no |
| <a name="input_enable_eks_public_access"></a> [enable\_eks\_public\_access](#input\_enable\_eks\_public\_access) | Whether the Amazon EKS public API server endpoint is enabled. | `bool` | `true` | no |
| <a name="input_enable_k8s_secrets_encryption"></a> [enable\_k8s\_secrets\_encryption](#input\_enable\_k8s\_secrets\_encryption) | Whether the Kubernetes secrets is encrypted by a AWS KMS Key. | `bool` | n/a | yes |
| <a name="input_enabled_cluster_log_types"></a> [enabled\_cluster\_log\_types](#input\_enabled\_cluster\_log\_types) | List of the desired control plane logging to enable. Allowed values are `api`, `audit`, `authenticator`, `controllerManager`, `scheduler`. | `list(string)` | `[]` | no |
| <a name="input_k8s_secrets_encryption_kms_arn"></a> [k8s\_secrets\_encryption\_kms\_arn](#input\_k8s\_secrets\_encryption\_kms\_arn) | ARN of the Key Management Service (KMS) customer master key (CMK). The CMK must be symmetric, created in the same region as the cluster, and if the CMK was created in a different account, the user must have access to the CMK. Only used when `enable_k8s_secrets_encryption` is `true`. | `string` | `null` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name to be used as a identifier for the created resources. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID which this EKS cluster will be part of. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->