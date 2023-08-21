
ifneq ($(wildcard ./.env),)
	include .env
	export
endif

check:
	terraform fmt
	tflint -f compact --recursive

init: check
	terraform init \
		-backend-config "key=tfstate/k8s-state.tfstate" \
		-backend-config "bucket=tf-state" -reconfigure

plan:
	terraform plan -out out.plan

apply:
	terraform apply "out.plan"

destroy:
	terraform destroy
