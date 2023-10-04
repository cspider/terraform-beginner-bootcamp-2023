# Terraform Begineer Bootcamp Week 1

## Fixing tags

[How to Delete Local and Remote Tags on Git](https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

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

n Terraform, there is a special variable called `path` that allows us to reference local paths:
- path.module
- path.root
- path.cwd
[Special Path variables](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)


### Issues with absolute path and fixed with path.root variable

In my terrahouse_aws/main.tf file in aws_s3_object, I had the path like this:
```
   source = "/gitpod/my-repo-name/public/index.html"
```
And `terraform apply` failed with the error that source file cannot be opened, file does not exist.
Once I replace `/gitpod/my-repo-name` with `${path.root}` it worked. So this worked

```go
   source = "${path.root}/public/index.html"
```
Andrew Brown did not have this issue, because Andrew is using local state.

### Use etag to trigger S3 Object copy when file content changes
```go
etag=filemd5("/path/to/file")
```
### Use fileexists("/path/to/file") to validate a file path variable value

Documentation: [Terraform fileexists function](https://developer.hashicorp.com/terraform/language/functions/fileexists)

```go
variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string
   validation {
     condition = fileexists("${var.index_html_filepath}")
     error_message = "The provided path for index.html does not exist"
   }
}
```
## Terraform Locals

Locals allows us to define local variables. 
It is very useful when we need to transform data within terraform code

```go
  locals {
    s3_origin_id = "MyS3Origin"
  }
```


## Terraform Datasources

[Terraform Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)


## Content Invalidation for CloudFront
[Invalidating files in cloudfront cache](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html)

Note: you can use S3 versioned files - versioning for cache invalidation - TODO - need to read more about this

You can also apply it in CLI
```bash
  aws cloudfront create-invalidation --distribution-id distribution_ID --paths "/*"
```

## Use jsonencode function to supply a policy json string as inline
[jsonencode function](https://developer.hashicorp.com/terraform/language/functions/jsonencode)

```go 
policy = jsonencode({
   your json document here
})

```
for .e.g.

```bash
> jsonencode({"hello"="world"})
"{\"hello\":\"world\"}"
```


## Terraform Resource Lifecycle Meta-argument

[Meta-arguments: Lifecycle](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)

1. use replce_by_trigger with a version and also ignore_changes argument

## Terraform 

[Terraform-Data resource](https://developer.hashicorp.com/terraform/language/resources/terraform-data)

Can be use to provide a virtual non-existent resources

