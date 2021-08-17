provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/dcdn"
}

// Domain
resource "alicloud_dcdn_domain" "this" {
  count             = var.create_domain ? 1 : 0
  domain_name       = var.domain_name
  check_url         = var.check_url
  resource_group_id = var.resource_group_id
  scope             = var.scope
  sources {
    content  = lookup(var.sources, "content", null)
    type     = lookup(var.sources, "type", null)
    port     = lookup(var.sources, "port", 80)
    priority = lookup(var.sources, "priority", 20)
    weight   = lookup(var.sources, "weight", 10)
  }
  status = var.status
}

// Domain configs
resource "alicloud_dcdn_domain_config" "this" {
  count         = length(var.domain_configs)
  domain_name   = local.domain_name
  function_name = var.domain_configs[count.index].function_name
  dynamic "function_args" {
    for_each = var.domain_configs[count.index].function_args
    content {
      arg_name  = function_args.value["arg_name"]
      arg_value = function_args.value["arg_value"]
    }
  }
}
