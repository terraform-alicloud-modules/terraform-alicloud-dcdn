# DCDN Domain variables
variable "scope" {
  description = "The acceleration region. Valid values: overseas, domestic, global."
  type        = string
  default     = "domestic"
}

variable "sources" {
  description = "The origin information."
  type        = map(string)
  default = {
    content  = "1.1.1.1"
    type     = "ipaddr"
    port     = 80
    priority = 20
    weight   = 10
  }
}

variable "status" {
  description = "The domain status. Valid values: online, offline."
  type        = string
  default     = "online"
}

# DCDN Domain config variables
variable "function_args" {
  description = "The args of the domain config."
  type        = list(map(string))
  default = [
    {
      arg_name  = "ip_list"
      arg_value = "110.110.110.110"
    }
  ]
}