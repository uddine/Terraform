## Replacing ressource : 

`Terraform Taint` est utilisé pour marquer une ressource pour le remplacement, la prochaine fois que vous exécutez apply (ancienne version)

`Terraform apply -replace="aws_instance.example[0]"` : est valide sur le plan et apply, et l'option replace fonctionne pour une seule ressource.

[x] step 1 : script pour creer une ressource --> init --> plan -->  Apply --> cree une ressource   
[x] step 2 : terraform apply -replace=aws_instance.mahine --> supprime ancien et le remplace avec une nouvelle instance. 

[x] step 3 : la ressource et supprimer sur la console aws 
[x] step 4 : If we run 

1 - terraform apply

- Terraform will notice that the VM is missing  
- Terraform will propose to create a new VM  
- The State File is correct  

2 -  terraform apply –refresh-only

- Terraform will notice that the VM you provisioned is missing.  
- With the refresh-only f  lag that the missing VM is intentional  
- Terraform will propose to delete the VM from the state file  
- The State File is wrong

Changes the state file to match infrastructure

## Terraform import : 

The terraform import command is used to import existing resources into Terraform  
`$ terraform import RESOURCE_ADDRESS ID` : can only import one ressource at a time and not all resources are importable.    
`$ terraform import aws_instance.example i-qd45sdf55` : example for importing a resource 

## ERROR 

Language errors :   
    - `$ terraform fmt`  
    - `$ terraform validate`  
    - `$ terraform version`  

State errors : 
    - `$ terraform refresh`  
    - `$ terraform apply`  
    - `$ terraform -replace flg`  

Core Errors and Provider errors :   
    - TF_LOG  
    - Open github issue  

## Debugging 

Terraform has detailed logs which can be enabled by setting the TF_LOG environment variable to:

    - TRACE  
    - DEBUG  
    - INFO  
    - WARN  
    - ERROR  
    - JSON — outputs logs at the TRACE level or higher, and uses a parseable JSON encoding as the formatting.  

Logging can be enabled separately:

TF_LOG _CORE  
TF_LOG _PROVIDER  

Example : TF_LOG=TRACE terraform apply 