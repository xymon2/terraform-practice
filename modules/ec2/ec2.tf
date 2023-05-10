resource "aws_instance" "ec2" {
    ami           = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.ec2_sg_private.id]
    associate_public_ip_address = var.associate_public_ip_address
    subnet_id = var.subnet_id
    iam_instance_profile = var.ec2_instance_profile
    key_name = var.key_name
    tags = {
        Name = var.name
    }
}
