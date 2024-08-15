locals {
  name            = lower(var.name)
  name_camel_case = replace(replace(replace(title(var.name), "-", " "), "_", " "), " ", "")

  common_tags = {
    ManagedBy       = "Terraform"
    TerraformModule = "terraform-aws-eks-multitool"
  }
}