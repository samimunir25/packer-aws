# This is variables file referred by packer source

variable "ami_name" {
  type        = string
  default     = "hippo-ami-image"
  description = "AMI Name of the image"
}

variable "ami_type" {
  type        = string
  default     = "t2.micro"
  description = "AMI type"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy EC2 instance for AMI"
}