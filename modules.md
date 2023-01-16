## Modules 

Un module est un conteneur pour plusieurs ressources qui sont utilisées ensemble. Les modules peuvent être utilisés pour créer des abstractions légères, de sorte que vous pouvez décrire votre infrastructure en termes d'architecture, plutôt que directement en termes d'objets physiques.


## Public modules 

- Terraform Registry is integrated directly into Terraform
- The syntax for specifying a registry module is **NAMESPACE/NAME/PROVIDER**
- **terraform init** command will download and cache any modules referenced by a configuration


## private modules 

- Private registry modules have source strings of the form **HOSTNAME/NAMESPACE/NAME/PROVIDER**
- To configure private module access, you need to authenticate against Terraform Cloud via **terraform login**
- Alternatively, you can create a user API Token and manually configure credentials in the CLI config file.

## Publishing Modules

Anyone can publish and share modules on the Terraform Registry.

Published modules support:

    - Versioning
    - automatically generate documentation
    - allow browsing version histories
    - show examples
    - READMEs
    - Public modules are managed via a public Git repo on GitHub

Once a module is registered, to push updates you simply push new versions to properly formed Git Tags.  
Repos names must be in the following format: terraform-PROVIDER-NAME

```hcl 

```