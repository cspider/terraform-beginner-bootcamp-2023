# Terraform Beginner Bootcamp 2023

## Semantic VErsioning

Ginve a version number **MAJOR.MINOR.PATCH**, increment the: 

- **MAJOR** 


etc.
(semver.org)(https://semver.org)

## Install the Terraform CLI

The Terraform CLI installation instructions have changed due to gpg keyring changes. So the original gitpod.yml bash commands did not work. Refer to the latest install cli instructions and updated .gitpod.yml file accordingly.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)


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
