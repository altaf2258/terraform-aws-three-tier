# Production-ready AWS Three-Tier Infrastructure (Terraform)

Purpose
-------
This repository provides a production-ready Terraform configuration to deploy a three-tier AWS architecture (networking, application, and data tiers) following best practices for modularity, remote state, and environment separation.

Repository layout
-----------------
- terraform/: root Terraform configuration and environment overlays
	- main.tf
	- variables.tf
	- provider.tf
	- outputs.tf
	- modules/: reusable modules (for example the `vpc` module)
		- vpc/
			- main.tf
			- variables.tf
			- outputs.tf

See the module code in [terraform/modules/vpc/main.tf](terraform/modules/vpc/main.tf).

Prerequisites
-------------
- Terraform 1.4+ recommended
- AWS CLI configured with appropriate credentials and region
- An S3 bucket and DynamoDB table for remote state locking (recommended)

Recommended Terraform backend (example)
--------------------------------------
Use an S3 backend with DynamoDB state locking in production. Example backend stanza (add to `terraform/provider.tf` or separate `backend.tf`):

```hcl
terraform {
	backend "s3" {
		bucket         = "<your-terraform-state-bucket>"
		key            = "terraform/state/three-tier/terraform.tfstate"
		region         = "us-east-1"
		dynamodb_table = "<your-lock-table>"
		encrypt        = true
	}
}
```

Quick start (developer)
-------------------------
1. Configure AWS credentials (e.g., `aws configure`).
2. Initialize Terraform and download modules:

```bash
cd terraform
terraform init
```

3. Plan and apply (use a workspace per environment or separate state keys):

```bash
terraform workspace new staging || terraform workspace select staging
terraform plan -var-file=env/staging.tfvars -out staging.plan
terraform apply "staging.plan"
```

Usage and environments
----------------------
- Use Terraform workspaces or separate state keys per environment (dev/staging/prod).
- Keep sensitive values in a secure secrets manager or encrypted tfvars (do not check secrets into VCS).

Variables and configuration
---------------------------
- Define environment-specific values in `env/*.tfvars` (create these outside VCS or via CI/CD secrets).
- Use the variables exposed by modules. See the VPC module variables in [terraform/modules/vpc/variables.tf](terraform/modules/vpc/variables.tf).

Architecture and modules
------------------------
- This repo models a three-tier architecture:
	- Network (VPC, subnets, route tables) — implemented in `modules/vpc`.
	- Application tier (EC2/ASG, ALB or EKS) — extendable from root configs.
	- Data tier (RDS, EFS, or managed data services) — configured via modules or root configs.
- Modules are located under `terraform/modules`. Reusable module inputs/outputs are defined clearly to make promotion across environments simple.

Outputs
-------
- Root-level outputs are declared in `terraform/outputs.tf` and module outputs are available under each module's `outputs.tf`.

CI/CD and automation
--------------------
- Run `terraform init` and `terraform validate` in CI for each merge to main.
- Use `terraform plan -out` and require approval of `terraform apply` via your pipeline for production.

Security and best practices
---------------------------
- Do not store secrets in Git. Use secrets managers (AWS Secrets Manager, SSM Parameter Store) or your CI secret store.
- Enable MFA and least-privilege IAM for automation accounts.
- Use versioned S3 bucket and server-side encryption for state storage.

Testing and validation
----------------------
- Use `terraform validate` and `terraform fmt` in CI.
- Add `tflint` and `checkov` or similar policy-as-code scanners for security checks.

Troubleshooting
---------------
- If `terraform init` fails, check provider versions and network connectivity.
- For state lock issues, inspect your DynamoDB lock table and that the S3 bucket name/key are correct.

Contributing
------------
1. Open an issue describing the change or bug.
2. Create a branch and submit a pull request with tests or validation steps.

License
-------
Specify your project license here (for example MIT). Replace this line with your license file and a short note.

Contact
-------
For support or questions, open an issue in this repository.

---
Generated and maintained by the repository maintainers.
