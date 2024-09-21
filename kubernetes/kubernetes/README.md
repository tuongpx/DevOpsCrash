Baker/Kubernetes
================
Compose and build your own Kubernetes cluster

## 1. Folder structure
```
kubernetes/
├── README.md
├── ansible/
│   ├── inventory.ini.sample
│   ├── playbook-addons.yaml
│   ├── playbook-provision.yaml
│   ├── variables.yaml.sample
│   └── roles/
│       └── <role_name>/
│           ├── README.md       # Note, turorial and references of this Ansible role
│           └── ...             # other files/folders follow standard structure of Ansible role
└── docs/
    ├── README.md               # User guide: how to deploy Kubernetes cluster using Baker
    └── DAY-2-OPERATIONS.md     # Use-cases & solution when operating Kubernetes
```
