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
ssh_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDhbf85Cz+s12eQm7dCv6lvwC5Bdn5x5W/u23maslHGkNt+1VI8ZNJ5lOwezm0mxySBWenkDol3lPTTudYXDMQZN7LhdzaJ83Pqf2Wk8uAWr/6VmMEW+L8JgCOqa/OuappYq1e3RlnbG2KQ4NFDJw/4TgOwuSijuf2vBhi8VtpD9tqSmcPaK8POxqXwXjqxJLgmA+aFqjYTPFMTWExesWvuLUqz6XzOMSvliD+C2VFPOkuaojBWXeK2Hi5ZPdvqGlz266k+t58LV5dZJANS4wL4R1KialIjEl1n+djO7HVHdnexJ16bOYald+/2xFTit5Vb22X3PzoKoDhGrb3VerWdP+Ehn+ZxIfErF48VKJT7DH8/hD6IgGq5YRDfOlocSczK2K9a8JkvuFz3X2VBU2Cg09Tzo8dE0WjsH7YWVmUOzDxhOh74z/1Wjq+3GZv+iYRcbjSjkpMvTSeoPfjWRYi8t/3SOrw8/E6G2ltftBUGUP9ubn6ENCoIuzJM/rbwZYwnHFROGyhCxlfrtAhRhMdnLBLgnlBJ9GHiEb5PrYQpj3CvdGfr8Z0702V0D9kknAGLh9tsskolhLZ3CBW90HrRAbmOwNJLcrlCEJ40wQPtpK5QftpxQ4xufwsQUnMDGKF1WlUj2QcTfCMAJNBX4Rg0x50AAi6H0YtOL2eL3dp9Sw== mishagin@asuslaptop"

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