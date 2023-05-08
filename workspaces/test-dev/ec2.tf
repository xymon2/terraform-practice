module "ec2_private_1" {
    source = "../../modules/ec2"
    name = "test_private_1"
    instance_type = "t2.micro"
    ami = "ami-02f6e1ad275c55e0b"
    associate_public_ip_address=false
    subnet_id = module.vpc.private_subnet_id
    vpc_id = module.vpc.vpc_id
    ec2_instance_profile = module.s3_for_ec2.iam_instance_profile_for_ec2
}