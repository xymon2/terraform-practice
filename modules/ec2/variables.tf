variable "name" {
    description = "The name of the EC2 instance"
    type = string
}

variable "instance_type" {
    description = "The instance type of ec2"
    type = string
}


variable "ami" {
    description = "The AMI of ec2"
    type = string
}

variable "associate_public_ip_address" {
    description = "Associate a public ip address with an instance in a VPC"
    type = bool
}

variable "subnet_id" {
    description = "The subnet id for ec2"
    type = string
}

variable "vpc_id" {
    description = "The vpc id for ec2"
    type = string
}

variable "ec2_instance_profile" {
    description = "The IAM instance profile for ec2"
    type = string
}