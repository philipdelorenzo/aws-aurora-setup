# This 'include' block will pull in the parent `_envcommon/terragrunt.hcl` file.
#include "root" {
#  path = find_in_parent_folders()
#}
include "envcommon" {
  path = "../_envcommon/common.hcl"
  expose = true
}

# The source parameter specifies which Terraform module to use
terraform {
  source = "../../modules/aurora"
}
