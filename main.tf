provider "aws" {
  region = var.region
}


##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################


module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "ec2sg"
  description = "Security group for usage with test EC2 instance"
  vpc_id      = "vpc-02b8cxxxxxxxxxxxxxc4"

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

resource "aws_eip" "this" {
  vpc      = true
  instance = module.ec2.id[0]
}


module "ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_count = 1

  name          = var.name
  ami           = "ami-ebd02392"
  instance_type = var.instance_type
  subnet_id     = "subnet-0fb7553a3e0fb6251"
  #  private_ips                 = ["172.31.32.5", "172.31.46.20"]
  vpc_security_group_ids      = ["sg-09ebdcd1639f26fef"]
  associate_public_ip_address = true
  key_name        = var.key

  tags = {
    Name   = "database"
  }

}

