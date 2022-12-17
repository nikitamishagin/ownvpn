output "external_ip" {
  description = "The external ip address of your instance."
  value = yandex_vpc_address.addr.external_ipv4_address[0].address
}