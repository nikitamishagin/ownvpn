output "external_ip" {
  description = "The external ip address of your instance."
  value       = yandex_compute_instance.ownvpn.network_interface[0].nat_ip_address
}