## Terraform apply 

Terraform apply command executes the actions proposed in an execution plan  

- `$ terraform apply` crée un nouveau plan d'éxecution automatique sans transmettre un fichier de plan enregistré, et en passant l'option **-auto-approve** terraform applique le plan sans demander de confirmation. 

- `$ terraform apply FILE ` crée un nouveau plan a partir d'un fichier 

- `$ Terraform show` permet d'inspecter un fichier de plan enregistré avant de l'appliquer.

## terraform apply -replace 

/!\ Force replace a ressource   
Command : `$ terraform apply -replace=random_string.random`


## Apply Options 

- -lock=false- Ne maintenez pas de verrou d'état pendant l'opération. Ceci est dangereux si d'autres peuvent exécuter simultanément des commandes sur le même espace de travail.

- -no-color- Désactive les séquences de formatage du terminal dans la sortie. Utilisez ceci si vous exécutez Terraform dans un contexte où sa sortie sera rendue par un système qui ne peut pas interpréter le formatage du terminal. 

