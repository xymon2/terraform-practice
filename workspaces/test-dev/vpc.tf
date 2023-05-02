module "vpc" {
    source = "../../modules/vpc"
    name = "test-dev-vpc"
    cidr_block = "10.0.0.0/16"
    public_cidr_block = "10.0.1.0/24"
    private_cidr_block = "10.0.2.0/24"
    public_az = "ap-northeast-1a"
    private_az = "ap-northeast-1a"
}