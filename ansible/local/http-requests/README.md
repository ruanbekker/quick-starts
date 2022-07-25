# Ansible HTTP Requests

This quick-start demonstrate how to use the ansible [uri](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/uri_module.html) module to make http requests. The examples below are all using the `local` connection method.

## Usage

To run the HTTP **GET** request playbook:

```bash
$ ansible-playbook playbooks/get-requests.yml 

PLAY [get requests playbook] *************************************************************************************
TASK [make a get request] ****************************************************************************************
ok: [laptop]

TASK [return response] *******************************************************************************************
ok: [laptop] => {
    "msg": {
        "completed": false,
        "id": 1,
        "title": "delectus aut autem",
        "userId": 1
    }
}

PLAY RECAP *******************************************************************************************************
laptop                     : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

## Resources

- https://docs.ansible.com/ansible/latest/collections/ansible/builtin/uri_module.html