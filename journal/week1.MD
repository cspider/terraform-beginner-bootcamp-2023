# Terraform Begineer Bootcamp Week 1


## Root Module Structures

Our root module structure is as follows:


PROJECT ROOT<br/>
|-- variables.tf<br/>
|-- main.tf<br/>
|-- providers.tf - define required providers<br/>
|-- outputs.tf<br/>
|-- terraform.tfvars - data of variables we want to load into our terraform project<br/>
|-- README.md - required for root modules<br/>

[Terraform Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

##Terraform Cloud and Input variables 
## Terraform Cloud Variables

In terraform we can set two kind of variables:
- Environment Variables - those you would set in your bash terminal, e.g., AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file

We can set Terraform cloud variables to be sensitive, so that it is not visible to public

### Loading Terraform Input Variables

[Terraform input values in Hashicorp documentation](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file e.g. `terraform -var="user_uuid"`

```bash
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```
See here: [Input variables in command line](https://developer.hashicorp.com/terraform/cli/commands/plan#input-variables-on-the-command-line)

### var-file flag in CLI

- Specify variables in a file with extension .tfvars or .tfvars.json and then spcify that file on the command-line with -var-file values

### terraform.tfvars
This is the default file to load in terraform variables in 

### auto.tfvars

- TODO: document this functionality

### Order of terraform variables

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

1. When using a CLI workflow, variables applied to a run with either -var or -var-file overwrite workspace-specific and variable set variables that have the same ke
1. Environment variables starting with TF_VAR `export TF_VAR_image_id=ami-abc123`
1. The terraform.tfvars file, if present.
1. The terraform.tfvars.json file, if present.
1. Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
1. Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

Important: In Terraform 0.12 and later, variables with map and object values behave the same way as other variables: the last value found overrides the previous values. This is a change from previous versions of Terraform, which would merge map values instead of overriding them.

=======
## Root Module Structures

Our root module structure is as follows:
- PROJECT ROOT
  - variables.tf
  - main.tf
  - providers.tf - define required
  - outputs.tf
  - terraform.tfvars - data of variables we want to load into our terraform project
  - README.md - required for root modules

[Terraform Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)


## Terraform Import

### Terraform dealing with config drift
### Fix manual configuration

### Fix missing resources with Terraform import 

[Terraform import](https://developer.hashicorp.com/terraform/cli/import)

If someone goes and delete for modified cloud resource manually through manual action like click and delete.

If we run Terraform plani, is with attempt to put our infrastructure back inot the expected state fixing Configuration Drift


### Fix using TF refresh
```
   terraform apply --refresh-only --auto-approve
```

## Terraform Modules

### Terraform Module Sourcess

[Terraform modules documentation](https://developer.hashicorp.com/terraform/language/modules/sources)

Using the source we can import the module from various places, e.g.:
- locally
- GitHub
- Terraform registry 
- any custom terraform registry

### Terrafor module structures
It is recommend to place modules in a "modules" directory


Passing Input Variables

We can pass input variables to our module. The module has to declare the terraform variables in its own variables.tf

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}


Using the source we can import the module from various places eg:

- locally
- Github
- Terraform Registry

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
[Modules Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

## Root Module Structure

## Considertation when using ChatGPT to write Terraform
LLMs such as ChatGPT may not be trained on the latest documentation or information about Terraformm

It may like produce older examples that could be deprecated, often effecting providers. 

## Working with Files in Terraform 

### Path variables.

In Terraform, there is a special variable called `path` that allows us to reference local paths:
- path.module
- path.root
- path.cwd
[Special Path variables](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

