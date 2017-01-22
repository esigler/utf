# Quick infra for OpenAI Universe agents

This is a collection of [Terraform][tf] & [Packer][pk] files to create and
manage running agents against OpenAI's Universe.

## Why?

Building an RL agent is tough enough without having to deal with the infra. 

## Setup

*NOTE:* This is not super useful yet.  Right now, it's just a faster way to
set up a single host to run experiments on in EC2.

Prerequsites: Have Terraform, Packer installed. Have an AWS account.

1. Create an AWS IAM role for Terraform.  I gave it full admin rights, YMMV.
1. Put the key & secret into single_host.json & terraform.tfvars.
1. Bake an AMI using `packer build single_host.json`, take the AMI ID from
   that and put it into `single_host.tf` (and edit the subnet_id, key_name,
   and instance_type to appropriate values as well.)
1. Run `terraform apply` to create a host.

At the end, you should have a host, suitable for ssh'ing into, and for example
running the [Universe Starter Agent][ua] on.

## Teardown

1. Run `terraform destroy` & confirm to destroy the host.

## TODO

* Add VPC, subnet & key setup to TF so that it handles that case.
* Set up Kubernetes in TF so that it can be used as a job processor.
* Set up Tensorflow / Tensorboard better.
* Archive/preserve data when done / scaling down hosts.

[tf]: https://www.terraform.io/
[pk]: https://packer.io
[ua]: https://github.com/openai/universe-starter-agent