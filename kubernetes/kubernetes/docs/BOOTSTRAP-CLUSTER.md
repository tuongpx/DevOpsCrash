Bootstrap Cluster
=================
Tutorial how to bring up kubernetes cluster.

## Step 1. Provisioning
1. Create file `inventory.ini`
2. Run provision
```bash
ansible-playbook -i inventory.ini playbook-provision.yaml -K
```

## Step 2. Boostrap cluster
1. On first (master) machine
* Copy and modify `kubeadm.yaml`
* Run command
```bash
kubeadm init --config=kubeadm.yaml --experimental-upload-certs
```

2. Join other masters
3. Join other workers

## Step 3. Install Addons
1. Create file `inventory.ini`
2. Provide variable in file `variables.yaml`
3. Run ansible
```bash
ansible-playbook -i inventory.ini -e @variables.yaml playbook-addons.yaml -K
```
