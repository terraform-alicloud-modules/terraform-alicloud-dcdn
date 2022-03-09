# DCDN Domain variables
scope = "overseas"
sources = {
  "content" : "test168.com",
  "type" : "domain",
  "port" : "443",
  "priority" : "30",
  "weight" : "20",
}

# DCDN Domain config variables
function_args = [
  {
    "arg_name" : "ip_list",
    "arg_value" : "100.100.100.100"
  }
]