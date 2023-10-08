# Bug Demonstrator

## Getting Started

Make sure the [backend.cfg](terraform/backend.cfg) file populated with the appropriate values
from [Linode](https://cloud.linode.com/linodes).

- Linode
    - API Tok*en
    - Object Storage and Access Keys*

### Terraform and Ansible

Ansible playbooks removed to simplify the deployment process.

The following make item runs the terraform routines.

```bash
make tf_full_reset
```

