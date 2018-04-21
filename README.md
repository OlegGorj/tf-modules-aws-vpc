[![GitHub release](https://img.shields.io/github/release/OlegGorj/tf-modules-aws-vpc.svg)](https://github.com/OlegGorj/tf-modules-aws-vpc/releases)
[![GitHub issues](https://img.shields.io/github/issues/OlegGorj/tf-modules-aws-vpc.svg)](https://github.com/OlegGorj/tf-modules-aws-vpc/issues)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/0c85a578cb0c4c85bddb373a6f3686ce)](https://app.codacy.com/app/oleggorj/tf-modules-aws-vpc?utm_source=github.com&utm_medium=referral&utm_content=OlegGorj/tf-modules-aws-vpc&utm_campaign=badger)

# Terraform Modules: AWS VPC

Templated Terraform module to implement VPC on AWS


### Prerequisites:
- existing CMK in AWS KMS
- generated keys pair


## How to use Bastion module:

Example of `../environments/dev/dev.tfvars` file:

```bash
export ENVIRONMENT="dev"

export AWS_REGION="ca-central-1"
export AWS_PROFILE="default"

export AWS_STATE_BUCKET="tf-state-bucket"

export AWS_KMS_ARN="arn:aws:kms:ca-central-1:4545454545:key/xxxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxxx"
export TF_VAR_kms_key_id=${AWS_KMS_ARN}
```

Init terraform:

```bash

# example of usage is located under ./test directory
cd test

terraform init  \
    -backend-config="bucket=ca-central-1.aws-terraform-state-bucket" \
    -backend-config="key=terraform/bastionbox.tfstate" \
    -backend-config="region=ca-central-1" \
    -backend-config="profile=dev"  \
    -var-file=../environments/dev/dev.tfvars

```

Plan terraform:

```bash
terraform plan -var-file=../environments/dev/dev.tfvars -out=./terraform
```

Apply terraform:

```bash
terraform apply -var-file=../environments/dev/dev.tfvars
```
