
# Getting started

To get started, you need to bootstrap the Azure subscriptions to support InfraWeave.

This is in **early preview**.

## Note

Current status:

- [x] InfraWeave Platform base (list+publish modules/stacks, list+create+destroy deployments etc)
- [ ] Reconciler - *In progress*
- [ ] Logging
- [ ] Gitops - Webhook support
- [ ] Identity access management review

## Clone the repo

Clone the [azure-bootstrap](https://github.com/infraweave-io/azure-bootstrap) which is designed to make it easy to get started.

It has the following structure:

```
.
├── examples/
|   ├── modules/...
|   └── claims/...
├── LICENSE
├── README.md
├── central.tf
├── locals.tf
└── project1-dev.tf
```

# Configuration

Before you bootstrap the control plane you need to configure it as you want.

## Configure settings

Modify the file `locals.tf`.

## Configure the central account

Modify the file `central.tf`.

1. Set up one central-module per region you want to support
1. Configure a corresponding provider per region and name accordingly

## Configure each workload account

In this example we have `project1-dev` to demonstrate how it can be set up, each project has its own `.tf`-file.

1. Set up one workload-module per region you want to support
1. Configure a corresponding provider per region and name accordingly

# Setting up

Ensure you have an active sso-sesion: `az login`.

Perform the bootstrapping by running

```tf
terraform init
terraform apply
```

This will bootstrap the entire platform in all desired Azure subscriptions.

# How to run

Set up environment:

```bash
export INFRAWEAVE_ENV=dev
export REGION=westeurope 
export PROVIDER=azure
```

Use the latest version of [CLI](https://preview.infraweave.io/getting-started/setting-up/) and publish a module (can only be done with access to central subscription):

```bash
export AZURE_SUBSCRIPTION_ID=00000000-0000-0000-0000-000000000000 # Central subscription id
infraweave publish module dev ./examples/modules/storagebucket/
```

List available modules:

```bash
infraweave publish module list dev
```

Deploy a claim (can only be done in a workload subcsription):

```bash
export AZURE_SUBSCRIPTION_ID=11111111-1111-1111-111111111111 # Workload subscription id
infraweave apply playground ./examples/claims/claim_storagebucket.yaml
```
