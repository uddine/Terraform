## Terraform cloud 

Terraform Cloud is an application that helps teams use Terraform together.

Terraform Cloud features:

- Manages your state files
- History of previous runs
- History of previous states
- Easy and secure variable injection
- Tagging
- Run Triggers (chaining workspaces)
- Specify any version of terraform per workspace
- Global state sharing
- Commenting on Runs
- Notifications via Webhooks, Email, Slack
- Organization and Workspace Level Permissions
- Policy as Code (via Sentinel Policy Sets)
- MFA,
- Single Sign On (SSO) (at Business tier)
- Cost Estimation (at Teams and Governance Tier)
- Integrations with ServiceNow, Splunk, K8, and custom Run Tasks

## Organizations 

An organization is a collection of workspaces

## Workspaces

A workspace belongs to an organization.  
A workspace represents a unique environment or stack.

## Teams

A team is composed of multiple members (users).  
A team can be assigned to workspaces

## Runs

A run represents a single run of the terraform run environment that is operating on an execution plan.

Runs can be UI/VCS driven API driven or CLI driven

Terraform cloud offers  types of cloud Run Workflows : 
    - UI/VCS : integrated with a specific branch in your VCS 'github' 
    - API-Driven : workspaces are not directly associated with a vcs
    - CLI driven : the user runnung terraform CLI command 

## Terraform cloud API tokens

Supports three types of Api tokend : 

Organization : 

    - Have permissions across the entire organization
    - Each organization can have one valid API token at a time
    - Only organization owners can generate or revoke an organization's token.
    - Organization API tokens are designed for creating and configuring workspaces and teams. 
    - Not recommended as an all-purpose interface to Terraform Cloud


Teams : 

    - allow access to the workspaces that the team has access to, without being tied to any specific user
    - Each team can have one valid API token at a time
    - any member of a team can generate or revoke that team's token
    - When a token is regenerated, the previous token immediately becomes invalid
    - designed for performing API operations on workspaces.
    - same access level to the workspaces the team has access to

User : 

    - Most flexible token type because they inherit permissions from the user they are associated with
    - Could be for a real user or a machine user.

## Terraform Cloud Agents

Terraform Cloud Agents is a paid feature of the Business plan to allow Terraform Cloud to communicate with isolated, private, or on-premise infrastructure.