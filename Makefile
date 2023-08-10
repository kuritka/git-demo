
check:
	terraform fmt

run: check
	$(call terraform)


apply:
	terraform apply "out.plan"

define terraform
	terraform init \
		-backend-config "key=tfstate/k8s-state.tfstate" \
		-backend-config "bucket=tf-state" -reconfigure
	terraform plan -out out.plan
endef
