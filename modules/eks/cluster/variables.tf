variable "name" {
  type = string
}

variable "eks_version" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
