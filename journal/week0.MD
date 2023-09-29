# Terraform Begineer Bootcamp Week0

# Terraform Begineer Bootcamp Week0

# Table of contents

- [Terraform Beginner Bootcamp 2023](#terraform-beginner-bootcamp-2023)
  - [Semantic Versioning](#semantic-versioning)
  - [Install the Terraform CLI](#install-the-terraform-cli)
  - [Refactoring into Bash Scripts](#refactoring-into-bash-scripts)
- [Doucmentations](#doucmentations)
- [AWS CLI Installation](#aws-cli-installation)
  - [Terraform Basics](#terraform-basics)
  - [Terraform validate](#terraform-validate)
  - [Terraform destroy](#terraform-destroy)
  - [Using multiple provider](#using-multiple-provider)
  - [Need to create environment variables in terraform cloud workspace](#need-to-create-environment-variables-in-terraform-cloud-workspace)
  - [Issues with Terraform Cloud Login and Gitpod Workspace](#issues-with-terraform-cloud-login-and-gitpod-workspace)


## Semantic Versioning

Ginve a version number **MAJOR.MINOR.PATCH**, increment the: 

- **MAJOR** 


etc.
(semver.org)(https://semver.org)

## Install the Terraform CLI

The Terraform CLI installation instructions have changed due to gpg keyring changes. So the original gitpod.yml bash commands did not work. Refer to the latest install cli instructions and updated .gitpod.yml file accordingly.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


## GitPod Lifecycle (Before, Init, Command)

We need to bcareful when using the Init because it will not rerun if we restart an existing workspace

https://www.gitpod.io/docs/configure/workspaces/tasks

## Working with Env Vars

### Persisting Vars in GitPod

## Refactoring into Bash Scripts 






# Doucmentations

GitPod Tasks - [Here](https://www.gitpod.io/docs/configure/workspaces/tasks)

# AWS CLI Installation
AWS CLI is installed for the project via the bash script [./bin/install_aws_clis.sh](./bin/install_aws_cli.sh)

[AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following command:
```sh 
aws sts get-caller-identity
```

you get a response like this:
```json
{
    "UserId": "xxxxxxxxx",
    "Account": "1234567890123",
    "Arn": "arn:aws:iam::123456789012:user/some-user-here"
}
```
## Terraform Basics

### Terraform Registry

### Learning about Terraform registry and also trying to navigate Terraform Providers and Modules

- **Terraform Providers** are logical abstractions of upstream API for different types of services and cloud providers. They are responsible for understanding the API interactions and exposing resources from the service providers.

- **Terraform Modules** are a way to make large amount of Terraform code modular, portable and sharable. 

The providers and modules are located at the following URL: 
[Terraform Registry](https://registry.terraform.io/)

### Terraform Init
### Terraform Plan
### Terraform Apply
### Terraform Output
    terraform output --auto-approve
## Terraform validate
## Terraform destroy
    terraform destroy 

`.terraform.lock.hcl`  contains the locked versioning for the providers of modules that should be used with the project. 

The terraform lock file should be commited to your Version Control System like GitHub

`.terraform.tfstate` contain information about the current state of your infrastructure. 

This **file should not be commiitted** to the source control system. This file can contain sensitive data. If you lose the file, you lose knowing the state of your infrastructure. 

`.terraform.tfstate.backup` - previous state file

### Terraform directory


## Using multiple provider

You can have only one required provider block, so if you want to add multiple providers, use all of them in `required_providers` block, 
and define provider block for each of those. For each resources, use provider name to avoid confusions. 

## Need to create environment variables in terraform cloud workspace 

Otherwise aws provider failed with the error that "No credential sources found"





## Issues with Terraform Cloud Login and Gitpod Workspace

When attempting to run `terraform login`, it will launch a wiswig view in bash to generate a token. Did not work for Andrew Brown, but worked for me.

The file where the token is stored is: `<user-home>/.terraform.d/credentials.tfrc.json` with permission `600`

```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "Token-from-Terraform-Cloud-Account-here"
    }
  }
}

```



## Semantic VErsioning

Ginve a version number **MAJOR.MINOR.PATCH**, increment the: 

- **MAJOR** 


etc.
(semver.org)(https://semver.org)

## Install the Terraform CLI

The Terraform CLI installation instructions have changed due to gpg keyring changes. So the original gitpod.yml bash commands did not work. Refer to the latest install cli instructions and updated .gitpod.yml file accordingly.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


## GitPod Lifecycle (Before, Init, Command)

We need to bcareful when using the Init because it will not rerun if we restart an existing workspace

https://www.gitpod.io/docs/configure/workspaces/tasks

## Working with Env Vars

### Persisting Vars in GitPod

## Refactoring into Bash Scripts 






# Doucmentations

GitPod Tasks - [Here](https://www.gitpod.io/docs/configure/workspaces/tasks)

# AWS CLI Installation
AWS CLI is installed for the project via the bash script [./bin/install_aws_clis.sh](./bin/install_aws_cli.sh)

[AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following command:
```sh 
aws sts get-caller-identity
```

you get a response like this:
```json
{
    "UserId": "xxxxxxxxx",
    "Account": "1234567890123",
    "Arn": "arn:aws:iam::123456789012:user/some-user-here"
}
```
## Terraform Basics

### Terraform Registry

### Learning about Terraform registry and also trying to navigate Terraform Providers and Modules

- **Terraform Providers** are logical abstractions of upstream API for different types of services and cloud providers. They are responsible for understanding the API interactions and exposing resources from the service providers.

- **Terraform Modules** are a way to make large amount of Terraform code modular, portable and sharable. 

The providers and modules are located at the following URL: 
[Terraform Registry](https://registry.terraform.io/)

### Terraform Init
### Terraform Plan
### Terraform Apply
### Terraform Output
    terraform output --auto-approve
## Terraform validate
## Terraform destroy
    terraform destroy 

`.terraform.lock.hcl`  contains the locked versioning for the providers of modules that should be used with the project. 

The terraform lock file should be commited to your Version Control System like GitHub

`.terraform.tfstate` contain information about the current state of your infrastructure. 

This **file should not be commiitted** to the source control system. This file can contain sensitive data. If you lose the file, you lose knowing the state of your infrastructure. 

`.terraform.tfstate.backup` - previous state file

### Terraform directory


## Using multiple provider

You can have only one required provider block, so if you want to add multiple providers, use all of them in `required_providers` block, 
and define provider block for each of those. For each resources, use provider name to avoid confusions. 

## Need to create environment variables in terraform cloud workspace 

Otherwise aws provider failed with the error that "No credential sources found"





## Issues with Terraform Cloud Login and Gitpod Workspace

When attempting to run `terraform login`, it will launch a wiswig view in bash to generate a token. Did not work for Andrew Brown, but worked for me.

The file where the token is stored is: `<user-home>/.terraform.d/credentials.tfrc.json` with permission `600`

```json
{
  "credentials": {
    "app.terraform.io": {
      "token": "Token-from-Terraform-Cloud-Account-here"
    }
  }
}

```
