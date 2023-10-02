variable "subnet_ids" {
  type = list(string)
}

variable "configmap_roles" {
  type = any
}

variable "configmap_users" {
  type = any
}

variable "namespaces" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "eks_name" {

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

variable "fargate_subnets" {
  type = list(string)
}