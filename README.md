# Azure DevOps Lab

 * A hybrid environment (local and cloud based) designed to test features from Azure DevOps, ranging from Azure Repos, Azure Pipelines and Self Hosted agents;

 * Cloud provider: Azure Cloud;
 * Tools and Tecnhology Stack: Azure DevOps (SCM and Pipelines), KEDA (Agent Pool scheduling), DevContainers (Development Environment);

 ## Project Structure

 ```
 .
├── README.md
├── helm
│   └── charts
│       └── keda
│           └── placeholder.yml
├── infrastructure
│   ├── computing
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── networking
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── live-environments
    └── placeholder.tf
 ```