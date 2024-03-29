# Creating a user from the root account
resource "azuread_user" "usr01" {
  user_principal_name = "afactor05@gmail.com"
  display_name        = "V. Anolu"
  mail_nickname       = "vscode-user"
  city                = "lagos"
  company_name        = "Lights On Heights Holding Limited"
  country             = "NG"
  employee_type       = "Employee"
  job_title           = "DevOps Engineer"
}

# Assigning an Azure Kubernetes Cluster Admin role to the user on the Azure subscription 
data "azurerm_subscription" "sub-01" {
}

resource "azurerm_role_definition" "role_def" {
  name               = ""
  role_definition_id = "0ab0b1a8-8aac-4efd-b8c2-3ee1fb270be8"
  scope              = data.azurerm_subscription.sub-O1.id
  description        = "This is a custom role created via Terraform"


  permissions {
    actions     = ["Microsoft.ContainerService/managedClusters/runcommand/action", "Microsoft.ContainerService/managedClusters/read", "Microsoft.ContainerService/managedClusters/accessProfiles/listCredential/action", "Microsoft.ContainerService/managedClusters/listClusterAdminCredential/action"] # These actions list, manage, run users issues on cluster
    not_actions = []
  }

  # adding the subscription in the role assign
  assignable_scopes = [
    data.azurerm_subscription.primary.id
  ]
}

resource "azurerm_role_assignment" "role_for_ak8" {
  scope                = data.azurerm_subscription.sub-01.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  role_definition_id   = azurerm_role_definition.role_def.role_definition_id
  principal_id         = azuread_user.usr01.id
  principal_type       = "User"
}