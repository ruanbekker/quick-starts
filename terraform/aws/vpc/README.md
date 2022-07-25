# Terraform - AWS VPC

This quick-start creates a AWS VPC with the terraform [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) provider.

## Info

This will create the following:

- VPC with a CIDR of `172.18.0.0/16` (cidr has been split up into 8 subnets - 2 spare for if new az's come online)
- 3 subnets in a private range
- 3 subnets in a public range
- internet gateway for public routes
- nat gateway with a eip for private routes
- subnets tagged with Tier=public/private

## Subnets

CIDR: 172.18.0.0/16

Left two ranges open for future availability zones.

| Subnet Address  | Netmask       | Range of Addresses            | Useable IPs                   | Hosts | AWS AZ       | Tier    |
| --------------- | ------------- | ----------------------------- | ----------------------------- | ----- | ------------ | ------- |
| 172.18.0.0/19   | 255.255.224.0 | 172.18.0.0 - 172.18.31.255    | 172.18.0.1 - 172.18.31.254    | 8190  |  us-west-1a  | Private |
| 172.18.32.0/19  | 255.255.224.0 | 172.18.32.0 - 172.18.63.255   | 172.18.32.1 - 172.18.63.254   | 8190  |  us-west-1b  | Private |
| 172.18.64.0/19  | 255.255.224.0 | 172.18.64.0 - 172.18.95.255   | 172.18.64.1 - 172.18.95.254   | 8190  |  us-west-1c  | Private |
| 172.18.96.0/19  | 255.255.224.0 | 172.18.96.0 - 172.18.127.255  | 172.18.96.1 - 172.18.127.254  | 8190  |  n/a         | Private |
| 172.18.128.0/19 | 255.255.224.0 | 172.18.128.0 - 172.18.159.255 | 172.18.128.1 - 172.18.159.254 | 8190  |  us-west-1a  | Public  |
| 172.18.160.0/19 | 255.255.224.0 | 172.18.160.0 - 172.18.191.255 | 172.18.160.1 - 172.18.191.254 | 8190  |  us-west-1b  | Public  |
| 172.18.192.0/19 | 255.255.224.0 | 172.18.192.0 - 172.18.223.255 | 172.18.192.1 - 172.18.223.254 | 8190  |  us-west-1c  | Public  |
| 172.18.224.0/19 | 255.255.224.0 | 172.18.224.0 - 172.18.255.255 | 172.18.224.1 - 172.18.255.254 | 8190  |  n/a         | Public  |

## Usage

Define the aws region that you would like to use in `variables.tf` as it defaults to `us-west-1`, then provision:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Resources

- https://www.davidc.net/sites/default/subnets/subnets.html
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs

