variable "access_key" {}
variable "secret_key" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-c716a9a7"
  instance_type = "m4.16xlarge"
  subnet_id     = "subnet-00355677",
  key_name      = "onosendai_key"
}
