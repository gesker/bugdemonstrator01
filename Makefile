tf_init:
	terraform -chdir=./terraform init --backend-config=backend.cfg

tf_upgrade:
	terraform -chdir=./terraform init --upgrade --backend-config=backend.cfg

tf_plan:
	terraform -chdir=./terraform plan

tf_apply:
	terraform -chdir=./terraform apply -auto-approve

tf_destroy:
	terraform -chdir=./terraform apply -destroy -auto-approve

tf_certs:
	terraform -chdir=./terraform apply -auto-approve -target=null_resource.generate_self_signed_certificates

tf_full_reset:
	terraform -chdir=./terraform init --backend-config=backend.cfg
	terraform -chdir=./terraform init --upgrade --backend-config=backend.cfg
	terraform -chdir=./terraform apply -destroy -auto-approve
	terraform -chdir=./terraform plan
	terraform -chdir=./terraform apply -auto-approve


## All Ansible make directives removed for bug demo ###
	
	
	
	






