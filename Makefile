export

test:
	$(eval export AWS_PROFILE=AWSSandbox)
	$(eval export TERRAFORM_WORKSPACE=terraform-aws-quicksight-rds)
	$(eval export ENV_NAME=test)
	@true

terraform-clean:
	rm -rf \
		terraform.tfstate.d \
		.terraform/environment \
		.terraform/terraform.tfstate

init:
	terraform init
	terraform workspace select ${TERRAFORM_WORKSPACE}

show: init
	terraform show

lint: init
	tflint --init
	tflint
		
sec: init
	tfsec .

plan: init
	tflint --init
	tflint
	tfsec .
	terraform plan \
		-var-file ./environments/${ENV_NAME}/terraform.tfvars

plan-cost: init
	terraform plan \
		-var-file ./environments/${ENV_NAME}/terraform.tfvars \
		-out plan-cost.tfplan > /dev/null
	terraform show \
		-json plan-cost.tfplan > plan-cost.json
	jq -cf ~/GitHub/terraform-cost-estimation/terraform.jq plan-cost.json > plan-cost.anon.json
	rm -f plan-cost.tfplan

apply: init
	terraform apply \
		-var-file ./environments/${ENV_NAME}/terraform.tfvars

destroy: init
	terraform destroy \
		-var-file ./environments/${ENV_NAME}/terraform.tfvars