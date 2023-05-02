variable "name" {
    description = "The name of the VPC"
    type = string
}

variable "cidr_block" {
    description = "The CIDR block of the VPC"
    type = string
}
  
variable "public_cidr_block" {
    description = "The CIDR block of the public subnet"
    type = string
}
  
variable "private_cidr_block" {
    description = "The CIDR block of the private subnet"
    type = string
}
  
variable "public_az" {
    description = "The availability zone of the public subnet"
    type = string
}
  
variable "private_az" {
    description = "The availability zone of the private subnet"
    type = string
}