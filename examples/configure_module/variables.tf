variable "name" {
  default = "openvpn"
}

variable "region" {
  default = "eu-west-1"
}

variable "amis" {
  type = map(string)
  default = {
    "eu-west-1" = "ami-0773391ae604c49a4"
  }
}

variable "instance_type" {
  default = "t3a.nano"
}

variable "key_name" {
  default = "cem"
}

variable "vpc_id" {
  description = "VPC id where to place the security group"
}

variable "subnet_id" {
  default = "subnet-68839330"
}

variable "cidr" {
  default = "172.31.0.0/16"
}

variable "source_dest_check" {
  default = false
}

variable "user_data" {
  default = ""
}

variable "tags" {
  type = map(string)
  default = {
    Name = "OpenVPN"
  }
}

variable "volume_tags" {
  type = map(string)
  default = {
    Name = "OpenVPN"
  }
}
