resource "alicloud_resource_manager_resource_group" "this" {
  display_name        = "for-terraform-test"
  resource_group_name = "terratest"
}
module "dcdn" {
  source        = "../../"
  create_domain = true
  domain_name   = var.domain_name
  check_url     = var.check_url
  sources = {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
  }
  //  sources = var.sources
  status = "online"
  //  domain_configs = var.domain_configs
  domain_configs = [
    {
      function_name = "ip_allow_list_set"
      function_args = [
        {
          arg_name  = "ip_list"
          arg_value = "110.110.110.110"
        }
      ]
    },
    {
      function_name = "filetype_based_ttl_set"
      function_args = [
        {
          arg_name  = "ttl"
          arg_value = "300"
        },
        {
          arg_name  = "file_type"
          arg_value = "jpg"
        },
        {
          arg_name  = "weight"
          arg_value = "1"
        }
      ]
    }
  ]
}
