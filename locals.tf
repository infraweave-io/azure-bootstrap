
locals {
  environment             = "dev"
  central_subscription_id = "00000000-0000-0000-0000-000000000000"
  tags = {
    #Environment = local.environment
    #Application = "InfraWeave"
    # Add more tags as needed
  }

  all_regions = ["westeurope"]

  central_github_repos_oidc = []

  all_workload_projects = [
    {
      project_id          = "11111111-1111-1111-111111111111"
      name                = "workload1-dev-workload"
      regions             = ["westeurope"]
      description         = "test dev"
      github_repos_deploy = []
      github_repos_oidc   = []
    }
  ]
}
