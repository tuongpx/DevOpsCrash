`CRI/docker`
============

## 1. Ansible role Configuration
| Parameter        | Type          | Description                                        | Default  |
|------------------|---------------|----------------------------------------------------|----------|
| `docker_channel` | string        | Update channel. One of `stable`, `nightly`, `test` | `stable` |
| `docker_users`   | array[string] | List username will added into `docker` group       | `[]`     |

## 2. References
* [Install Docker for Linux](https://docs.docker.com/install/)
