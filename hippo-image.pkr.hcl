packer {
  required_plugins {
    amazon = {
      version = "1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "base-ubuntu-image" {
  ami_name               = "${var.ami_name}-${local.timestamp}"
  instance_type          = var.ami_type
  region                 = var.region
  skip_region_validation = true
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      root-device-type    = "ebs"
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
    }
    owners      = ["amazon"]
    most_recent = true
  }

  ssh_username          = "ubuntu"
  force_deregister      = false
  force_delete_snapshot = false
}

build {
  sources = [
    "source.amazon-ebs.base-ubuntu-image"
  ]

  provisioner "shell" {
    script = "./script.sh"
  }

}