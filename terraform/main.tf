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
  zone                     = "ru-central1-a"
}

resource "yandex_compute_instance" "ownvpn" {
    folder_id                 = "b1g03tpdbjpq22ekdtls"
    hostname                  = "ownvpn"
    labels                    = {}
    metadata                  = {
        "install-unified-agent" = "0"
        "serial-port-enable"    = "1"
        "ssh-keys"              = "mishagin:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC499ZksssxclICZQJS2tn+zWN+g8fe3U69R1RL26uMczTe5MK2JpvFhqXc9hld2uThHUXUI6VzHmUquwqZrUp1CYbTxf/4zqu8DJtabQt3Xot2UmdXdzi8MFYsiRf6ENlBMy6vpWkC0fHlkrku/nnElrcy1lD8gdShQFKGT6bDImfTi8v+uG7ElDlPDKgLYbe0Wa93L43NBfjKdRzYi/1mkhSusMfS3R2T3UKeThHlqFYpGmvH1gf77Uzk8oHHflCojqoyAK10CG0uf4deE2Jf27pNOiu3G9cvuIiSuqtZn1QGIYGhjSyfNcseBygCMuvDH/cOf3Ol2/NIZqmSSjIiyoLTRVh+qqPq1psHctg+VdaRkIuuC/s6/UVvfR5vjY96NYONffyP9rXKRzc6JbYEjBzwYZweZAVbyhXcXLMvvCtNth4WS1SJXEvC0G19iN6TKBmnY9ZjqbrP08S8ZHdZtQW9KCFZqhHHtTrVPvCLFzNgT3XOSMl64OKpkAi7KiUg8daFQ3JNey82N37ggnXtsvnCE7Z7NctLz/+05XTIwm/5iqCoF9uE47BJLtY3/yyB9epkTx8Dc7/QbfQqOO/6swW45IPRWQIdf/2eKksUWjPalTmxDyXDLATKU45VK/GOavw8cWBdSGTn7y6P3tNYGrQhesEiJ2CxzZpiHr8fkw== mishagin@asuslaptop"
        "user-data"             = <<-EOT
            #cloud-config
            datasource:
             Ec2:
              strict_id: false
            ssh_pwauth: no
            users:
            - name: mishagin
              sudo: ALL=(ALL) NOPASSWD:ALL
              shell: /bin/bash
              ssh_authorized_keys:
              - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC499ZksssxclICZQJS2tn+zWN+g8fe3U69R1RL26uMczTe5MK2JpvFhqXc9hld2uThHUXUI6VzHmUquwqZrUp1CYbTxf/4zqu8DJtabQt3Xot2UmdXdzi8MFYsiRf6ENlBMy6vpWkC0fHlkrku/nnElrcy1lD8gdShQFKGT6bDImfTi8v+uG7ElDlPDKgLYbe0Wa93L43NBfjKdRzYi/1mkhSusMfS3R2T3UKeThHlqFYpGmvH1gf77Uzk8oHHflCojqoyAK10CG0uf4deE2Jf27pNOiu3G9cvuIiSuqtZn1QGIYGhjSyfNcseBygCMuvDH/cOf3Ol2/NIZqmSSjIiyoLTRVh+qqPq1psHctg+VdaRkIuuC/s6/UVvfR5vjY96NYONffyP9rXKRzc6JbYEjBzwYZweZAVbyhXcXLMvvCtNth4WS1SJXEvC0G19iN6TKBmnY9ZjqbrP08S8ZHdZtQW9KCFZqhHHtTrVPvCLFzNgT3XOSMl64OKpkAi7KiUg8daFQ3JNey82N37ggnXtsvnCE7Z7NctLz/+05XTIwm/5iqCoF9uE47BJLtY3/yyB9epkTx8Dc7/QbfQqOO/6swW45IPRWQIdf/2eKksUWjPalTmxDyXDLATKU45VK/GOavw8cWBdSGTn7y6P3tNYGrQhesEiJ2CxzZpiHr8fkw== mishagin@asuslaptop
        EOT
    }
    name                      = "ownvpn"
    network_acceleration_type = "standard"
    platform_id               = "standard-v3"
    service_account_id        = "ajedkig2bbo615k6fomu"
    zone                      = "ru-central1-a"

    boot_disk {
        auto_delete = true
        mode        = "READ_WRITE"

        initialize_params {
            block_size = 4096
            size       = 5
            type       = "network-ssd"
        }
    }

    metadata_options {
        aws_v1_http_endpoint = 1
        aws_v1_http_token    = 1
        gce_http_endpoint    = 1
        gce_http_token       = 1
    }

    network_interface {
        ip_address         = "10.128.0.26"
        ipv4               = true
        ipv6               = false
        nat                = true
        nat_ip_address     = "51.250.5.16"
        security_group_ids = []
        subnet_id          = "e9bgr0e54f3q7ulv429d"
    }

    placement_policy {
        host_affinity_rules = []
    }

    resources {
        core_fraction = 20
        cores         = 2
        gpus          = 0
        memory        = 1
    }

    scheduling_policy {
        preemptible = true
    }
}
