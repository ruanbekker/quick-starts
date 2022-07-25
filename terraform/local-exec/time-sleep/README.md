# Terraform with Delay

Using the null resource we can demonstrate a delay after resource creation and deletion using [sleep](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep).

## Usage

When creating the resource it will sleep for 10s:

```bash
$ terraform init
$ terraform apply -auto-approve

null_resource.previous: Creating...
null_resource.previous: Provisioning with 'local-exec'...
null_resource.previous (local-exec): Executing: ["/bin/sh" "-c" "echo 'foo' > file.txt"]
null_resource.previous: Creation complete after 0s [id=4572588651629938240]
time_sleep.wait_10_seconds: Creating...
time_sleep.wait_10_seconds: Creation complete after 10s [id=2022-07-25T15:09:57Z]
time_sleep.wait_10_seconds: Still creating... [10s elapsed]
null_resource.next: Creating...
null_resource.next: Creation complete after 0s [id=3616636602518223470]
```

When we destroy the resource it will sleep for 10s:

```bash
$ terraform destroy -auto-approve

Plan: 0 to add, 0 to change, 3 to destroy.
null_resource.next: Destroying... [id=3616636602518223470]
null_resource.next: Destruction complete after 0s
time_sleep.wait_10_seconds: Destroying... [id=2022-07-25T15:09:57Z]
time_sleep.wait_10_seconds: Still destroying... [id=2022-07-25T15:09:57Z, 10s elapsed]
time_sleep.wait_10_seconds: Destruction complete after 10s
null_resource.previous: Destroying... [id=4572588651629938240]
null_resource.previous: Destruction complete after 0s
```

## Resources

- https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep
- https://www.terraform.io/language/resources/provisioners/local-exec