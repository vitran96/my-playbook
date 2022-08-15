# Windows playbook

## Installation

### Ansible Control node 🕹

1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

   1. Upgrade Pip: `pip3 install --upgrade pip`
   2. Install Ansible: `pip3 install ansible`

2. Clone or download this repository to your local drive.
3. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible collections.
4. Add the IP address and credentials of your Windows machine into the [inventory](./default.inventory.ini) file
5. Run `ansible-playbook -i inventory.ini main.yml` inside this directory.

### Running a specific set of tagged tasks

```sh
ansible-playbook -i inventory.ini main.yml --tags "choco,wsl"
```

## Author

This project was inspired by [Alexander Nabokikh](https://www.linkedin.com/in/nabokih/)
