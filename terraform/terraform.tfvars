// The location where the instance was created
zone               = "ru-central1-a"
folder_id          = "b1g03tpdbjpq22ekdtls"
service_account_id = "ajedkig2bbo615k6fomu"

// Service account option
sa_name            = "vpnuser"

// Security group option
default_network_id = "enpn0so7nhg38firn6fb"
sg_name            = "group_vpn"
vpn_cidr_blocks    = ["0.0.0.0/0"]
ssh_cidr_blocks    = ["0.0.0.0/0"]

// Access to instance
username           = "mishagin"
ssh_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC499ZksssxclICZQJS2tn+zWN+g8fe3U69R1RL26uMczTe5MK2JpvFhqXc9hld2uThHUXUI6VzHmUquwqZrUp1CYbTxf/4zqu8DJtabQt3Xot2UmdXdzi8MFYsiRf6ENlBMy6vpWkC0fHlkrku/nnElrcy1lD8gdShQFKGT6bDImfTi8v+uG7ElDlPDKgLYbe0Wa93L43NBfjKdRzYi/1mkhSusMfS3R2T3UKeThHlqFYpGmvH1gf77Uzk8oHHflCojqoyAK10CG0uf4deE2Jf27pNOiu3G9cvuIiSuqtZn1QGIYGhjSyfNcseBygCMuvDH/cOf3Ol2/NIZqmSSjIiyoLTRVh+qqPq1psHctg+VdaRkIuuC/s6/UVvfR5vjY96NYONffyP9rXKRzc6JbYEjBzwYZweZAVbyhXcXLMvvCtNth4WS1SJXEvC0G19iN6TKBmnY9ZjqbrP08S8ZHdZtQW9KCFZqhHHtTrVPvCLFzNgT3XOSMl64OKpkAi7KiUg8daFQ3JNey82N37ggnXtsvnCE7Z7NctLz/+05XTIwm/5iqCoF9uE47BJLtY3/yyB9epkTx8Dc7/QbfQqOO/6swW45IPRWQIdf/2eKksUWjPalTmxDyXDLATKU45VK/GOavw8cWBdSGTn7y6P3tNYGrQhesEiJ2CxzZpiHr8fkw== mishagin@asuslaptop"

// The main parameters of the instance
hostname           = "ownvpn"
labels             = {}
name               = "ownvpn"
platform_id        = "standard-v3"

// Boot disk options
auto_delete        = true
disk_mode          = "READ_WRITE"
device_name        = ""
block_size         = 4096
size               = 5
type               = "network-ssd"

// Instance resources
core_fraction      = 20
cores              = 2
gpus               = 0
memory             = 1
preemptible        = true

// Instance network interface
nat                = true
subnet_id          = "e9bgr0e54f3q7ulv429d"