# Backend 

## Définition 

La partie du noyau de Terraform qui détermine comment Terraform stocke l'état et exécute les opérations (telles que plan , apply , import, etc.).   
Les backends ne sont pas des plugins, il n'est donc pas possible d'installer des backends supplémentaires.

> Backend : signifie toujours le code intégré qui gère l'état et les opérations.

> Terraform écrit la configuration du backend en texte brut dans deux fichiers distincts *[.terraform/terraform.tfstate]*

> Tous les fichiers de plan capturent les informations *[.terraform/terraform.tfstate]* au moment de la création du plan. Cela permet de s'assurer que Terraform applique le plan au bon ensemble d'infrastructures.


## Standrat backend 
---------------------

- Ne stocke que l'état : 

    - S3 locking via dynamo Db 
    - AzurRM with locking 
    - Google cloud storage with locking : GC object storage 

- N'effectue pas d'opérations terraform, par exemple Terraform apply.Pour effectuer des opérations, vous utilisez le CLI sur votre machine locale.
- Les backends third-party sont des backends standard, par exemple AWS S3.

```sh
#main.tf 
terraform { 
    backend "s3" {
        bucket = "terraform-state000"
        key    = "statefile"
        region = "us-east-1"
    }
}
```
The backup of a state file will reside on local machine.   
La configuration d'un backend standart n'ecessite pas terraform cloud ou un workspace.  

## Local backend 
----------------
Backend par défaut qui stocke l'état sous forme de fichier local sur le disque.

- stocke l'état sur le système de fichiers local
- verrouille cet état en utilisant les API du système
- effectue des opérations localement

```sh 
terraform { 
    ## Par défaut, vous utilisez l'état du backend lorsque vous n'avez pas spécifié backend.
    
}
```

**OU** 

```sh
terraform { 
    # ON peut chaner le chemin d'accés au fichier local et au repertoire de travail
    backend "local" {
    path = "relative/path/to/terraform.tfstate"
    }
}
```
**OU Terraform_remote_state Data source avec un backend local** 

CROSS-REFERENCING STACKS  
La terraform_remote_statesource de données utilise le dernier instantané d'état d'un backend d'état spécifié **pour récupérer et lire les valeurs de sortie** du module racine à partir d'une autre configuration Terraform.

```sh
data "terraform_remote_state" "networking"{ 
    backend "local" 
    config = {
    path = "${path.module}/networking/terraform.tfstate"
    }
}
resource "aws_instance" "foo"{
    subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id 
}
```
    
## Enhanced backend 
-----------------------

- Peuvent tous deux stocker l'état
- Peuvent effectuer des opérations de terraformation

Les backends améliorés sont subdivisés en plusieurs catégories :

- local-file et les données sont stockés sur la machine locale qui exécute les commandes terraform   
- Remote-file et les données sont stockés dans le cloud, par exemple Terraform Cloud.

## Remote backend : 
---------------------------

Un backend distant utilise la plateforme Terraform qui est soit :

    - Terraform Cloud
    - Terraform Enterprise

With a remote backend when terraform apply is performed via the CLI, The Terraform Cloud Run Environment is responsible for executing the operation Because the Terraform Cloud Run Environment is executing the command. Your provider credentials need to be configured in Environment Variables in Terraform Cloud

Lorsque vous utilisez un remote backend, vous devez définir un espace de travail Terraform Cloud : 

1. Un seul workspace : **workspaces.name**

```sh
terraform { 
    backend "remote" {
    path = "app.terraform.io"
    organization = "company" 

    workspaces{
        name = "my-app-prod"
        }
    }
}
```
2. Plusieurs workspace : **workspaces.prefix**

 ```sh
terraform { 
    backend "remote" {
    path = "app.terraform.io"
    organization = "company" 

    workspaces{
        prefix = "my-app-"
        }
    }
}
```

Sur terraform apply, vous devrez choisir quel espace de travail vous voulez appliquer l'opération. Le fait de définir à la fois le nom et le préfixe entraînera une erreur.

**Terraform_remote_state Data source avec un remote backend** 

La source de données terraform_remote _state récupère les valeurs de sortie du module racine d'une autre configuration Terraform, en utilisant le dernier instantané d'état du remote backend.

```sh
data "terraform_remote_state" "networking"{ 
    backend "remote" 
    config = {
    organization = "hashicorp"
    workspace = {
        name = "vpc-prod"
        }
    }
}
resource "aws_instance" "foo"{
    subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id 
}
```

## Backend initialization 
-------------------------

Flag -backend-config pour terraform init peut être utilisé pour une configuration partielle du backend. 

Dans les situations où les paramètres du backend sont dynamiques ou sensibles et ne peuvent donc pas être spécifiés statiquement dans le fichier de configuration.

 ```sh 
#main.tf
terraform { 
    required_version = "~> 0.12.0"
    backend "remote" {}
}
```  

```sh
# backend.hcl 
    workspaces{name = "my-app-prod"}
    hostname = "app.terrform.io"
    organization = "company" 
    
```

`$ terraform init -backend-config=backend.hcl`
















