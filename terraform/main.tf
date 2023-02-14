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

// Configure the service account
resource "yandex_iam_service_account" "monitor" {
  folder_id = var.folder_id
  name      = var.sa_name
}

// Configure the security group
resource "yandex_vpc_security_group" "group_vpn" {
  description = "Access to OpenVPN server."
  labels      = var.labels
  name        = var.sg_name
  network_id  = var.default_network_id

  egress {
    from_port      = 0
    labels         = var.labels
    port           = -1
    protocol       = "ANY"
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "openvpn"
    from_port      = -1
    labels         = var.labels
    port           = 1194
    protocol       = "UDP"
    to_port        = -1
    v4_cidr_blocks = var.vpn_cidr_blocks
  }

  ingress {
    description    = "ssh"
    from_port      = -1
    labels         = var.labels
    port           = 22
    protocol       = "TCP"
    to_port        = -1
    v4_cidr_blocks = var.ssh_cidr_blocks
  }
}

// Configure the instance
resource "yandex_compute_instance" "ownvpn" {
  folder_id                 = var.folder_id
  hostname                  = var.hostname
  labels                    = var.labels
  allow_stopping_for_update = true
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
  service_account_id = yandex_iam_service_account.monitor.id
  zone               = var.zone

  boot_disk {
    auto_delete = var.auto_delete
    mode        = var.disk_mode
    device_name = var.device_name
    initialize_params {
      block_size = var.block_size
      size       = var.size
      type       = var.type
      image_id   = var.image_id
    }
  }

  network_interface {
    nat            = var.nat
    subnet_id      = var.subnet_id
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
