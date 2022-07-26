# Ansible Template Example

This quick-start shows you how to generate a file from a template using variables to determine the outcome.

## Usage

To run the playbook:

```bash
$ ansible-playbook playbook.yml

PLAY [generates file from template playbook] *********************************************************************
TASK [generate config from template] *****************************************************************************
changed: [laptop]
PLAY RECAP *******************************************************************************************************
laptop                     : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0 
```

Now we can see that the template from `./tempaltes/vars.env.j2` was parsed with our variables from our `playbook.yml` and the `vars.env` file was created:

```bash
$ cat vars.env
APP_OWNER=ruan
APP_ENV=dev
APP_IDS='AAB,ABC,ADF'
APP_IPS=10.0.1.3,192.168.10.4,172.16.18.2
EXTRA_PASS=foobar!
API_SECRET=null
```

## Resources

- https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html
