## Terraform plan 

Terraform command creates an execution plan (aka Terraform Plan).

**A plan consists of:**

    - Reading the current state of any already-existing remote objects to make sure that the Terraform state is up-to-date.
    - Comparing the current configuration to the prior state and noting any differences.
    - Proposing a set of change actions that should, if applied, make the remote objects match the configuration.
    - N'effectue pas les changements proposés. 

**Terraform plan propose :**

    - Speculative plans : Terraform produira la description de l'effet du plan mais sans intention de l'appliquer réellement.

    - Saved Plans : `$ Terraform plan -out=FILE.plan` Vous pouvez générer un fichier de plan sauvegardé que vous pouvez ensuite transmettre à terraform apply. eg terraform apply FILE.  
    Lorsque vous utilisez la fonction "save planed", vous n'êtes pas invité à confirmer et vous agissez comme pour l'auto-approbation.

## Planning Modes 

**1. Destroy mode :**

crée un plan dont le but est de détruire tous les objets distants qui existent actuellement, laissant un état Terraform vide.

`$ Terraform plan -destroy`  
`$ Terraform destroy`

**2. Refresh-only mode :**

crée un plan dont l'objectif est uniquement de mettre à jour l'état de Terraform et toutes les valeurs de sortie du module racine pour correspondre aux modifications apportées aux objets distants en dehors de Terraform. Cela peut être utile si vous avez intentionnellement modifié un ou plusieurs objets distants en dehors du flux de travail habituel. 

Command : `$ Terraform plan -refresh-only`  

## Planning Options

- -refresh=false :  Désactive le comportement par défaut de synchronisation de l'état de Terraform avec des objets distants avant de vérifier les modifications de configuration.  

- -replace=ADDRESS Demande à Terraform de prévoir de remplacer l'instance de ressource par l'adresse donnée. Ceci est utile lorsqu'un ou plusieurs objets distants sont dégradés et vous pouvez utiliser des objets de remplacement avec la même configuration pour vous aligner sur des modèles d'infrastructure immuables.
Et elle n'est disponible qu'à partir de Terraform v0.15.2. Pour les versions antérieures, utilisez **terraform taint** pour obtenir un résultat similaire.

- -target=ADDRESS- Ordonne à Terraform de concentrer ses efforts de planification uniquement sur les instances de ressource qui correspondent à l'adresse donnée et sur tous les objets dont ces instances dépendent.

## Remarque 

Le flg -refresh-only pour terraform plan or apply vous permet de rafraîchir et de mettre à jour votre fichier d'état sans apporter de modifications à votre infrastructure distante.  
Terraform **refresh** ne modifiera pas vos objets distants réels, mais elle modifiera l'état de Terraform.

`$ terraform refresh [option]` est en fait un alias de `$ Terraform apply -refresh-only -auto-approve`