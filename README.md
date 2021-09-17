Terraform module which creates DCDN domain and its config on Alibaba Cloud.
terraform-alicloud-dcdn
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-dcdn/blob/master/README-CN.md)

Terraform module which creates DCDN domain and sets its configs on Alibaba Cloud.

These types of resources are supported:

* [DCDN Domain](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dcdn_domain)
* [DCDN Domain Config](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dcdn_domain_config)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.131.0 |


## Usage

```hcl
module "dcdn" {
  source        = "terraform-alicloud-modules/dcdn/alicloud"
  create_domain = true
  domain_name   = "xxx.xiaozhu.com"
  sources = {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
  }
  status = "online"
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

```

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)



