## workspace : 

Les lieux de travail vous permettent de gérer plusieurs environnements ou fichiers d'états alternatifs, par exemple, le développement, la production.

    - CLI Workspaces – A way of managing alternate state files (locally or via remote backends)
    - Terraform Cloud Workspaces – acts like completely separate working directories

## Workspace avec un backend local 

- terraform stores the workspace state in terraform.tfstate.d 
- En pratique, les individus ou les très petites équipes sont connus pour livrer ces fichiers dans leurs dépôts.
- L'utilisation d'un backend distant est recommandée lorsqu'il y a plusieurs collaborateurs.

## Workspace abec un remote backend 

- The worspace files are stored directly in the configured backend

## Terraform cloud workspaces 

- You can create Workspaces on Terraform Cloud
- You can see a history of previous runs.
- Comment on each run
- You can see a history of previously held states (snapshots)
- A diff of what changed since the last state
- Download the state file

## Terraform cloud run triggers 

Terraform Cloud provides a way to connect your workspace to one or more workspaces via Run Triggers within your organization, known as "source workspaces".  

Triggers d'exécution sont conçus pour les espaces de travail qui dépendent d'informations ou d'infrastructures produites par d'autres espaces de travail.

Si une configuration Terraform utilise des sources de données pour lire des valeurs qui pourraient être modifiées par un autre espace de travail, triggers d'exécution vous permettent de spécifier explicitement cette dépendance externe.

## Terraform workspace commmand 

`$ terraform workspace list`  
`$ terraform workspace show`  
`$ terraform workspace select`  
`$ terraform workspace new`  
`$ terraform workspace delete` 

## Workspace cloud VS  local workspace 

- Terraform configuration : 
    * Local : On disk
    * Cloud : In linked version control repository, or periodically uploaded via API/CLI  

- Variable values : 
    * Local : As .tfvars files, as CLI arguments, or in shell environment
    * Cloud : In workspace

- State
    * Local : On disk or in remote backend
    * Cloud : In workspace

- Credentials and secrets : 
    * Local : In shell environment or entered at prompts
    * Cloud : In workspace, stored as sensitive variables