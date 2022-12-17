// Configure the Yandex.Cloud provider
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.zone
}

resource "yandex_vpc_address" "addr" {
  labels = var.labels

  external_ipv4_address {
    zone_id = var.zone
  }
}

// Configure the instance
resource "yandex_compute_instance" "ownvpn" {
  folder_id = var.folder_id
  hostname  = var.hostname
  labels    = var.labels
  metadata = {
    "install-unified-agent" = "0"
    "serial-port-enable"    = "1"
    "ssh-keys"              = "var.username:var.ssh_key"
    "user-data"             = <<-EOT
            #cloud-config
            datasource:
             Ec2:
              strict_id: false
            ssh_pwauth: no
            users:
            - name: ${var.username}
              sudo: ALL=(ALL) NOPASSWD:ALL
              shell: /bin/bash
              ssh_authorized_keys:
              - ${var.ssh_key}
        EOT
  }
  name               = var.name
  platform_id        = var.platform_id
  service_account_id = var.service_account_id
  zone               = var.zone

  boot_disk {
    auto_delete = var.auto_delete
    mode        = var.disk_mode
    device_name = var.device_name
    initialize_params {
      block_size = var.block_size
      size       = var.size
      type       = var.type
    }
  }

  network_interface {
    nat                = var.nat
    nat_ip_address     = yandex_vpc_address.addr.external_ipv4_address[0].address
    security_group_ids = var.security_group_ids
    subnet_id          = var.subnet_id
  }

  resources {
    core_fraction = var.core_fraction
    cores         = var.cores
    gpus          = var.gpus
    memory        = var.memory
  }

  scheduling_policy {
    preemptible = var.preemptible
  }
}
