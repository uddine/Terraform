
## Terraform Init 

    - Doanalding plugin dependecies, providers and modules 
    - Create terraform directory 
    - Create a dependecy lock file to enforce expected versions for plugins 
    - Terraform init will be running if you modify or change dependencies 

**1. Commande** : 

`Terraform init -upgrade :` upgrade all plugins to the latest version  
`Terafform init -get-plugins-false :` skip plugin installation  
`Terafform init -plugin-dir :` Force installation to read plugins only from target directory  
`Terafform init -lockfile=MODE :` set a dependency lockfile mode  

Dependecy lock file : **.terraform.lock.hcl**
State lock file : **.terraform.tfstate.lock.hcl** is created after terraform apply 

## Terraform get 

Command is used to download and update modules in the root module.  
It's used when you developer your own terraform modules because you do no want to initialize your state or pull new providers.   

## Terraform fmt 

`$ terraform fmt `: corrige la mise en forme des fichier terraform

## Terraform consol 

Terraform console is an interactive shell where you can evaluate expressions.  
We run a min command with the wrong arguments  
We correct the argument error  

## Initialization du backend 

Réexécuter init avec un backend déjà initialisé mettra à jour le répertoire de travail pour utiliser les nouveaux paramètres du backend. Soit **-reconfigure** ou **-migrate-state** doit être fourni pour mettre à jour la configuration du backend.
