

Terraform Enterprise is our self-hosted distribution of Terraform Platform

Terraform Enterprise offers a private instance of the Terraform Platform application with benefits such as:

- No resource limits
- with additional enterprise-grade architectural features
    - Audit logging
    - SAML single sign-on (SSO)

## Terraform entreprise requirements 

Operationel mode "how data be stored" :

    - Externel service : Postgres, aws s3 bucket, Gcp cloud storage bucket. 
    - Mounted Disk : Disque monté - stocke les données dans un répertoire séparé sur un hôte destiné à un disque externe, par exemple EBS, iSCSI.
    - Demo - stocke toutes les données sur l'instance, les données peuvent être sauvegardées avec des snapshots, non recommandé pour une utilisation en production. 

Credentiels : 

Vérifiez que vous disposez des informations d'identification pour utiliser Enterprise et que vous disposez d'une connexion sécurisée.

    - Terraform Enterprise License - Vous obtenez une licence auprès d'HashiCorp.
    - Certificat TLS et clé privée - Vous devez prouver que vous possédez votre propre certificat TLS.

## Air gapped environments  

Air Gap ou réseau déconnecté est une mesure de sécurité de réseau employée sur un ou plusieurs ordinateurs pour garantir qu'un réseau informatique sécurisé est physiquement isolé des réseaux non sécurisés, par exemple l'Internet public.

Pas d'Internet. Pas de connectivité extérieure

Les industries du secteur public (gouvernement, armée, etc.) ou les grandes entreprises (finance, énergie, etc.) utilisent souvent des réseaux à air grapped.

HashiCorp Terraform Enterprise prend en charge un type d'installation pour les air grapped environnements.

Pour installer ou mettre à jour Terraform Enterprise, vous devez fournir un " air gap bundle " qui est une archive d'une version de Terraform Enterprise.