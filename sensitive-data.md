## Local state 

- Lorsque vous utilisez un backend local, l'état est stocké dans des fichiers JSON en texte clair.
- Vous devez faire attention à ne pas partager ce fichier d'état avec qui que ce soit.
- Vous devez faire attention à ne pas commiter ce fichier dans votre dépôt git.


## remote state with terraform cloud

The terraform cloud remote backend : 

- Ce fichier d'état est conservé en mémoire et n'est pas persisté sur le disque.
- Le fichier d'état est crypté at-rest
- Le fichier d'état est crypté in-transit.
Avec Terraform Enterprise, vous disposez d'un log d'audit détaillé pour les preuves d'altération.

## Remote state with third-party storage 

- Vous devez examiner attentivement les capacités de ces backends pour déterminer s'ils répondront à vos exigences en matière de sécurité et de conformité.

- Certains backends ne sont pas par défaut aussi sûrs qu'ils pourraient l'être :
ex. Avec AWS S3, vous devez vous assurer que le cryptage et la gestion des versions sont activés, et vous devez créer une trace personnalisée pour les événements de données.

- S3 accepte les versions en l'activant dans les parametre de la console. Et le cryptage aussi faut l'activer dans propriéte


* **Backend state storage and locking** :  

    * Stockage d'état : 
        - Il se trouve que ces deux backends fournissent un verrouillage : local via les API système et Consul via les API de verrouillage.
        - Lors de l'utilisation d'un backend non local, Terraform ne conservera pas l'état n'importe où sur le disque, sauf dans le cas d'une erreur irrécupérable où l'écriture de l'état sur le backend a échoué. Ce comportement est un avantage majeur pour les backends : si des valeurs sensibles sont dans votre état, l'utilisation d'un backend distant vous permet d'utiliser Terraform sans que cet état ne soit jamais conservé sur le disque.

        - Dans le cas d'une erreur persistant dans l'état du backend, Terraform écrira l'état localement. Ceci afin d'éviter la perte de données. Si cela se produit, l'utilisateur final doit transmettre manuellement l'état au backend distant une fois l'erreur résolue.

## Exemple : 

**Azurerme** : 

Stocke l'état en tant que Blob avec la clé donnée dans le conteneur Blob du compte de stockage Blob. 
Ce backend prend en charge le verrouillage d'état et la vérification de la cohérence avec les fonctionnalités natives Azure Blob Storage.

**Consul** : 

Stocke l'état dans le magasin Consul KV à un chemin donné. Ce backend prend en charge le verrouillage d'état.
