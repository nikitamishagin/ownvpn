// The location where the instance was created
zone               = "ru-central1-a"
folder_id          = "b1g03tpdbjpq22ekdtls"

// Service account option
sa_name            = "monitor"

// Security group option
default_network_id = "enpn0so7nhg38firn6fb"
sg_name            = "group_vpn"
vpn_cidr_blocks    = ["0.0.0.0/0"]
ssh_cidr_blocks    = ["0.0.0.0/0"]

// Access to instance
username           = "mishagin"

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
image_id           = "fd89n8278rhueakslujo"

// Instance resources
core_fraction      = 20
cores              = 2
gpus               = 0
memory             = 1
preemptible        = true

// Instance network interface
nat                = true
subnet_id          = "e9bgr0e54f3q7ulv429d"