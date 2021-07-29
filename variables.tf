variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "Test-ec2"
}

variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "instance_count" {
  description = "Number of instances to launch"
  default     = 1
}


variable "instance_type" {
  description = "The type of instance to start"
  default     = "t3.micro"
}

variable "key" {
    description  = "Access key for ec2 instance"
    default      =  "rabbitmq"
}

