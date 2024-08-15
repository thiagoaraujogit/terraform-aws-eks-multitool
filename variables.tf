variable "name" {
  type        = string
  description = "A name to be used as a identifier for the created resources."
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID which this EKS cluster will be part of."
}

variable "enabled_cluster_log_types" {
  type        = list(string)
  description = "List of the desired control plane logging to enable. Allowed values are `api`, `audit`, `authenticator`, `controllerManager`, `scheduler`."
  default     = []

  validation {
    condition     = length(var.enabled_cluster_log_types) < 1
    error_message = "The value for variable `enabled_cluster_log_types` must be a list of string containing at least 1 value."
  }
}

variable "enable_eks_private_access" {
  type        = bool
  description = "Whether the Amazon EKS private API server endpoint is enabled."
  default     = false
}

variable "enable_eks_public_access" {
  type        = bool
  description = "Whether the Amazon EKS public API server endpoint is enabled."
  default     = true
}

variable "eks_public_access_allowed_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks. Indicates which CIDR blocks can access the Amazon EKS public API server endpoint when enabled."
  default     = ["0.0.0.0/0"]
}

variable "eks_subnet_ids" {
  type        = list(string)
  description = "List of Subnet IDs. Indicates in which VPC subnets the EKS cluster and it's nodes must be created."
}

variable "enable_k8s_secrets_encryption" {
  type        = bool
  description = "Whether the Kubernetes secrets is encrypted by a AWS KMS Key."
}

variable "k8s_secrets_encryption_kms_arn" {
  type        = string
  description = "ARN of the Key Management Service (KMS) customer master key (CMK). The CMK must be symmetric, created in the same region as the cluster, and if the CMK was created in a different account, the user must have access to the CMK. Only used when `enable_k8s_secrets_encryption` is `true`."
  default     = null
}

variable "k8s_version" {
  type        = string
  description = "Desired Kubernetes master version. If you do not specify a value, the latest available version at resource creation is used and no upgrades will occur except those automatically triggered by EKS."
  default     = null
}