# Registering an application on the user account to create a passwordless Azure Workload Identity OIDC to authenticate with GitHub Actions
resource "azuread_application_registration" "app-reg" {
  display_name     = "github-workflow-oidc-01"
  description      = "Application to run OIDC"
  sign_in_audience = "AzureADandPersonalMicrosoftAccount"
}

# Create a new federated credentials to GitHub Action to deploy Azure resources for the pipeline
resource "azuread_application_federated_identity_credential" "fed_cred" {
  application_id = azuread_application_registration.app-reg.id
  display_name   = "microservice-deployment-Azure-Kubernetes"
  description    = "Deployments of microservice to Kubernetes"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:victoranolu/microservice-deployment-Azure-Kubernetes:main"
}

