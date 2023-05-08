module "s3_for_ec2"{
    source = "../../modules/s3"
    name = "s3-for-ec2"
    bucket = "test-dev-s3-for-ec2"
}