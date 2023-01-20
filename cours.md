## Lien pour formation 

- [Exam pro LAB](https://github.com/ExamProCo/Terraform-Associate-Labs)
- [Terraform registry](https://registry.terraform.io/browse/providers)
- [Formation youtube](https://www.youtube.com/watch?v=_6AITxe5iVc&list=PLn6POgpklwWrpWnv05paAdqbFbV6gApHx&index=1&ab_channel=xavki)

## Getting Started

Les étapes pour création un projet terraform : 

    - Creating main.tf
    - Add AWS Provider
    - Generate and configure AWS credentials
    - Configure an AWS Virtual Machine
    - Initialize terraform project
    - Terraform fmt
    - Terraform validate
    - Terraform plan
    - Terraform apply
    - Terraform apply (updateing)
    - Create Input Variables
    - Set Locals
    - Create Outputs
    - Use a Terraform Module
    - Divide project into multiple files
    - Terraform destroy
    - Create a Terraform Cloud workspace
    - Migrate local to remote workspace
    - Move AWS Credentials to Env Vars

# terraform object types : 

- [x] Providers
- [x] Resources 
- [x] Data sources 

## Pourquoi terraform 

- Infrastructure as code 
- Automatisation de l'infrastructure
- Maintien d'infrastructure
- CI/CD 

## Variables and Outputs
------------------------------------
1. ### Input variables 

    - terraform.tfvars **Autoloaded**: by default this file will be autoloaded when included in the root of project directory

    - my_variables.auto.tfvars  **Autoloaded**: additional file who can loaded

    - my_variables.tfvars **NOT autoloaded** :  creat additional variables files, and you need to specific them in the CLI

    - Additional variable files and -var-file : specific variables inline via the command line for individual overrides 

    - TF_VAR_ : value can be defined by environment variables and will be read and loaded. 
        - `export TF_VAR_ myVar = 123`

2. ### Output variables 

Output values are computed values after a terraform apply, to obtain information. Outputs as `sensitive` so it does not show in output of CLI and will still be visible within the statefile 

To print all the output for a statefile : `$ terraform outputs`
                                          `$ terraform outputs -json` 
                                          `$ terraform outputs <value-specific>`
                                          `$ curl $(terraform output -raw lb_url)`

2. ### Local value 

Allow to assigns a name to an expression. 

2. ### Data Sources 

Donner plus d'informations sur un parametre dans la ressource. 
Data spurces allow terraform use information defined outside of terraform, defined by another separate terraform configuration, or modified by functions. 

## Resource Meta Arguements

- depends_on : for specifying explict dependecies 
- primitives types : string, number, bool, no type estendpoint = nul, list, map 
- count

### for_each

Si un bloc de ressource ou de module inclut un for_each argument dont la valeur est une carte ou un ensemble de chaînes, Terraform créera une instance pour chaque membre de cette carte ou de cet ensemble.

```sh
resource "aws_instance" "ec2" {
  for_each      = toset(var.host_type_list)
  ami           = data.aws_ami.ubuntu.id
  instance_type = each.key

  tags = {
    for key, value in var.ec2_tags :
    key => lower(value)
  }
}

variable "host_type_list" {
  type        = list(string)
  default     = ["t3.micro", "t3.small"]
  description = "A list of host types"
}
```
- provider and alias
- lifecycle

## Conditional expression 

A conditional expression uses the value of a bool expression to select one of two values. The syntax of a conditional expression is as follows: condition ? true_val : false_val

une condition pour déterminer si une instance EC2 doit être provisionnée ou non.

## Expressions
- String Templates
- Splats

## Dynamic Blocks
Un bloc dynamique agit un peu comme une expression for, mais produit des blocs imbriqués au lieu d'une valeur typée complexe.

## Versions Constraints MAJOR.MINOR.PATCH
------------------------------------------
    - MAJOR : Incompatible API changes
    - MINOR : when added functionality in a backwards compatible manner 
    - PATCH : bug fix 

    - != excludes an exact version number for example != 1.0.0 is not accepted 
    - ~> allow only the rightmost version lst member to increment for example ~> 1.0.(0 accept the incremation)

## Backends

- Standard Backend with Amazon S3
- Remote backend multiple workspaces
- terraform_remote_state local
- terraform_remote_state remote
- force-unlock

## debugg terraform 

Vous pouvez définir TF_LOGl'un des niveaux de journalisation (par ordre décroissant de verbosité) TRACE, DEBUG, INFOou pour WARNmodifier ERRORla verbosité des journaux.  

Le paramètre TF_LOGsur JSONgénère des journaux au TRACEniveau ou supérieur et utilise un encodage JSON analysable comme formatage.  
TF_LOG_CORE :   
Pour conserver la sortie journalisée, vous pouvez définir TF_LOG_PATH

## Resources

- collection types
- structual typeear

How does Terraform Cloud backup states?
Terraform Enterprise Air-gapped environment is designed to run in a network with no internet or outside connectivity
In order to authenticate to Terraform Cloud what is recommended for local development?

# Providers and modules 
- Provider : plugins that allow yyou to intercative with cloud service providers .... 
- Modules : is a groupe of configuration files that provide common configuration functionality 

## Exclusif : 
On utilise un des deux dans un bloc exemple count et for-each son mutuellement exclusifs. 

## identifiants et donnees sensibles : 

