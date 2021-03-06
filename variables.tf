data "http" "my_public_ip" {
  url  =  "http://ifconfig.co/json"
  request_headers = {
    Accept  = "application/json"
   }
}
locals {
  ifconfig_co_json = jsondecode(data.http.my_public_ip.body)
 }

output "my_ip_addr" {
  value = local.ifconfig_co_json.ip
 }
