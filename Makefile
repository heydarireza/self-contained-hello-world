.PHONY: install-requirements update-server install-docker setup-project build cleanup-projects
install-requirements:
	ansible-galaxy install -r requirements.yaml
update-server:
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml --tags server-update
install-docker:
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml --tags config-docker
setup-project:
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml --tags setup-project

build:
	ansible-galaxy install -r requirements.yaml
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml  --tags server-update 
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml  --tags config-docker
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml  --tags setup-project
cleanup-projects:
	ansible-playbook -i inventory/hosts.yaml playbooks/main.yaml --tags cleanup
