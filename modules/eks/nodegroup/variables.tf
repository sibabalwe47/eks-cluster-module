
variable "eks_cluster_name" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "eks_version" {
  type = string
}

variable "ami_type" {
  type = string
}

variable "capacity_type" {
  type = string
}

variable "instance_types" {
  type = list(string)
}

variable "scaling_config" {
  type = object({
    desired_size = number
    min_size     = number
    max_size     = number
  })
}
