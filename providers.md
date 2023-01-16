
## Provisioners
-----------------------------------

- Cloud-Init
- Local Exec : excution sur la machine terraform
- Remote Exec : exection sur la machine distante 
- File
- Connection
- Null Resource and Trigger

## Providers
-----------------------------------

Terraform s'appuie sur des plugins appelés "providers" pour interagir avec des systèmes distants et étendre les fonctionnalités.

### **1. Provider : fournisseurs de ressources par API**

- Provision AWS Resource
- Provision Azure Resource
- Provision GCP Resource

```sh
terraform {
  # Pour avoir le lien et informer Terraform d'utiliser le fournisseur via un required_providers 
  required_providers { 
    # Fournisseur 
    aws = {
      source = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = "default"
  region  = "eu-west-1"
	alias   = "eu"
}
```
### **2.  Providers command :** 

`$ Terraform providers` : pour récuperer la liste courante des providers utilisés 

## Terraform Registry
------------------------------------

Private Registry : publish private modules for our organization within the terraform cloud private registry


```h 
# provider.tf

terraform {
  required_version = ">= 1.1.0"

  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.1.0"
    }
  }
}

provider "local" {}
``` 










