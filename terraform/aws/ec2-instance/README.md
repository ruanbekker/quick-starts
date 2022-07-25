# Terraform AWS EC2 Instance

This quick-start provisions a EC2 instance with a IAM instance role as well as a Security Group using the [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) provider.

## Requirements

You will need to provide the following variables either via the cli `-var` or via the `terraform.tfvars` file:

- `vpc`:      the vpc id where you want your instance to be deployed to.
- `keyname`:  the ssh keypair that you would like to use to authenticate with ssh.
- `subnetid`: the subnetid into which subnet you want to place your instance in.

## Usage

Launching a EC2 instance with required variables placed in the `./terraform.tfvars` file:

```bash
$ terraform init
$ terraform plan -var-file="terraform.tfvars"
$ terraform apply -var-file="terraform.tfvars" -auto-approve
```

Provides the outputs of your EC2 instance:

```
Outputs:
id = "i-0a34cf350f0125781"
ip = "34.241.125.17"
subnet = "subnet-01e5141ce5c72d38a"
```

And testing SSH:

```bash
$ ssh -i ~/.ssh/rbkr.pem ubuntu@$(terraform output -raw ip)
ubuntu@ip-10-0-171-62:~$ uname -m
x86_64
ubuntu@ip-10-0-171-62:~$ logout
```

Destroying the infrastructure that we've deployed:

```bash
$ terraform destroy -auto-approve
```

## Resources

- https://registry.terraform.io/providers/hashicorp/aws/latest/docs