provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAUN2ZIAH4ERYW4MW4"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
   ami = "ami-06cffe063efe892ad"
   instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = "map"

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}
