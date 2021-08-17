terraform-alicloud-dcdn
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[全站加速域名（DCDN Domain）](https://www.alibabacloud.com/help/product/64812.htm). 

本 Module 支持创建以下资源:

* [全站加速域名（DCDN Domain）](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dcdn_domain)
* [全站加速域名配置（DCDN Domain Config）](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/dcdn_domain_config)

## 版本要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.131.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.131.0 |

## 用法

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

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)


