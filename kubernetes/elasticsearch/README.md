# This is ansible config for install elasticsearch cluster via ansible
Elasticsearch version 6.6.

Target host required python environment

**Only Ansible versions > 2.4.3.0 are supported**

## Usage

### Install role from ansible galaxy

`
ansible-galaxy install -r requirements.yml
`

### Config hosts and username in inventory.ini

```ini
[elastic_nodes]
node1 ansible_host=listing-stg1.teko.vn
node2 ansible_host=listing-stg2.teko.vn

[elastic_nodes:vars]
ansible_user=user_name

```

### Config elasticsearch in playbook.yml

```yaml
- hosts: elastic_nodes
  become: true
  roles:
    - role: elastic.elasticsearch
  vars:
    es_instance_name: "product_list"
    es_heap_size: "2g"
    es_config:
      cluster.name: "listing-cluster"
      discovery.zen.ping.unicast.hosts: ["listing-stg1.teko.vn","listing-stg2.teko.vn"]
      http.port: 9200
      transport.tcp.port: 9300
      node.data: true
      node.master: true
      network.host: "0.0.0.0"
      http.host: "0.0.0.0"
      bootstrap.memory_lock: false
    es_xpack_features: []
    es_scripts: false
    es_templates: false
    es_version_lock: false
    es_plugins:
      - plugin: ingest-geoip

```

### Run install ansible playbook

`ansible-playbook playbook.yml -i inventory.ini -K`
