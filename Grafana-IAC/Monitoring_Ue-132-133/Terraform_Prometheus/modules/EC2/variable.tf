# variable.tf im EC2-Verzeichnis

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
  
}

variable "subnet_ids" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "instance_ami" {
  type    = string
  default = "ami-06dd92ecc74fdfb36"
}

variable "key" {
  type    = string
  default = "aufgabe1133"
}
