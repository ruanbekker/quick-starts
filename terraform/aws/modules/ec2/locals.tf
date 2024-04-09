locals {
  project_name = "${var.project_identifier}-${var.environment_name}"
  ami_architecture = var.selected_ami_type == "ubuntu" ? var.arch : var.ami_configs[var.selected_ami_type].architecture
  default_tags = {
    "Owner"       = var.owner_name
    "ManagedBy"   = "terraform"
    "Environment" = var.environment_name
    "Project"     = var.project_identifier
    "CostCenter"  = var.team_name
  }
}
