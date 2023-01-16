## Terraform State
------------------

Terraform doit stocker l'état de votre infrastructure gérée et de votre configuration. Cet état est stocké par défaut dans un fichier local nommé **"terraform.tfstate"**, mais il peut également être stocké à distance, ce qui fonctionne mieux dans un environnement d'équipe dans.

This state file is a JSON data structure with a one-to-one mapping from resource instances to remote objects. 

### terraform state list 

liste des ressources in the state 

### terraform state show : 

show a ressource in the state : `$ terraform state show <name of the ressource>random_string.random`

### terraform state mv 

Vous pouvez utiliser terraform **state mv** endroit où vous souhaitez conserver un objet distant existant, mais le suivre en tant qu'adresse d'instance de ressource différente dans Terraform.

Par contre avec terraform plan souhaite remplacer la ressource existante avec une nouvelle ressource. 

`$ terraform state mv random_string.random random_string.my_random_string `

Déplacer un objet in the state ( rename existing resources, move a resource or a module into a module ), par contre terraform apply détruirera et recréera la ressource. 

        - Rename ressource : 
        - Move Resource into module : 
        - Move module into a module : 

### terraform state rm : 

supprimer une instance spécifique from the state   
Vous pouvez utiliser terraform state rm dans la situation moins courante où vous souhaitez supprimer une liaison à un objet distant existant sans le détruire au préalable.

`$ terraform state rm random_string.myrandom `   
|-> terraform state list 

### terraform state 

- terraform state pull : récupérer the remote state and output to stdout 
- terraform state push : update remote state from local state 
- terraform state replace-provider : Replace provider in the state 


## Remote state 

With remote state, Terraform writes the state data to a remote data store, which can then be shared between all members of a team.

Terraform prend en charge le stockage de l'état dans Terraform Cloud , HashiCorp Consul , Amazon S3, Azure Blob Storage, Google Cloud Storage, Alibaba Cloud OSS, etc.

L'état distant est implémenté par un backend ou par Terraform Cloud, que vous pouvez configurer dans le module racine de votre configuration.

Exemple : 

Si on effectue des changement au niveau du backend :    
`$ terrafoem init`
`$ rm terraform.tfstate*`
`$ terrafoem apply`

Observez que le fichier d'état n'est plus créé sur la machine locale après l'application (car il est stocké à distance)


### *Terraform state backup**

* **Terraform_remote_state Data source** : 
    * La terraform_remote_statesource de données utilise le dernier instantané d'état d'un backend d'état spécifié pour récupérer les valeurs de sortie du module racine à partir d'une autre configuration Terraform.
    
* **Backend state storage and locking** :  
    * Les commandes prises en compte : 
        - ` $ terraform console`
        - ` $ terraform state`
        - ` $ terraform taint`
    * Stockage d'état : 
        - Il se trouve que ces deux backends fournissent un verrouillage : local via les API système et Consul via les API de verrouillage.
        - Lors de l'utilisation d'un backend non local, Terraform ne conservera pas l'état n'importe où sur le disque, sauf dans le cas d'une erreur irrécupérable où l'écriture de l'état sur le backend a échoué. Ce comportement est un avantage majeur pour les backends : si des valeurs sensibles sont dans votre état, l'utilisation d'un backend distant vous permet d'utiliser Terraform sans que cet état ne soit jamais conservé sur le disque.

        - Dans le cas d'une erreur persistant dans l'état du backend, Terraform écrira l'état localement. Ceci afin d'éviter la perte de données. Si cela se produit, l'utilisateur final doit transmettre manuellement l'état au backend distant une fois l'erreur résolue.

* **Import existing ressources** : 
    * Terraform peut importer des ressources d'infrastructure existantes. L'importation Terraform peut uniquement importer des ressources dans l' état . L'importation ne génère pas de configuration. Avant d'exécuter, terraform importvous devez écrire manuellement un resourcebloc de configuration pour la ressource. Le bloc de ressources décrit où Terraform doit mapper l'objet importé.
 



