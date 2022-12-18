// The location where the instance was created
variable "zone" {
  description = "The availability zone where the virtual machine will be created. If it is not provided, the default provider folder is used."
  type        = string
  default     = "ru-central1-a"
}
variable "folder_id" {
  description = "The ID of the folder that the resource belongs to. If it is not provided, the default provider folder is used."
  type        = string
}
variable "service_account_id" {
  description = "ID of the service account authorized for this instance."
  type        = string
  default     = ""
}

// Service account option
variable "sa_name" {
  description = "Name of the service account. Can be updated without creating a new resource."
  type        = string
  default     = "vpnuser"
}

// Security group option
variable "default_network_id" {
  description = "ID of the network this security group belongs to."
  type        = string
}
variable "sg_name" {
  description = "Name of the security group."
  type        = string
  default     = "group_vpn"
}
variable "vpn_cidr_blocks" {
  description = "The blocks of IPv4 addresses for the OpenVPN connection rule."
  type        = list
  default     = ["0.0.0.0/0"]
}
variable "ssh_cidr_blocks" {
  description = "The blocks of IPv4 addresses for the SSH connection rule."
  type        = list
  default     = ["0.0.0.0/0"]
}

// Access to instance
variable "username" {
  description = "The username to access the instance."
  type        = string
  default     = "root"
}
variable "ssh_key" {
  description = "The public ssh key to access the instance."
  type        = string
}


// The main parameters of the instance
variable "hostname" {
  description = "Hostname for the instance."
  type        = string
  default     = "ownvpn"
}
variable "labels" {
  description = "A set of key/value label pairs to assign to the instance."
  type        = map(any)
  default     = {}
}
variable "name" {
  description = "Resource name."
  type        = string
  default     = "ownvpn"
}
variable "platform_id" {
  description = "The type of virtual machine to create."
  type        = string
  default     = "standard-v3"
}

// Boot disk options
variable "auto_delete" {
  description = "Defines whether the disk will be auto-deleted when the instance is deleted."
  type        = bool
  default     = true
}
variable "disk_mode" {
  description = "Type of access to the disk resource."
  type        = string
  default     = "READ_WRITE"
}
variable "device_name" {
  description = "Name that can be used to access an attached disk."
  type        = string
  default     = ""
}
variable "block_size" {
  description = "Block size of the disk, specified in bytes."
  type        = number
  default     = 4096
}
variable "size" {
  description = "Size of the disk in GB."
  type        = number
  default     = "5"
}
variable "type" {
  description = "Disk type."
  type        = string
  default     = "network-ssd"
}


// Instance resources
variable "core_fraction" {
  description = "If provided, specifies baseline performance for a core as a percent."
  type        = number
  default     = 100
}
variable "cores" {
  description = "CPU cores for the instance."
  type        = number
  default     = 2
}
variable "gpus" {
  description = "GPU for the instance."
  type        = number
  default     = 0
}
variable "memory" {
  description = "Memory size in GB."
  type        = number
  default     = 2
}
variable "preemptible" {
  description = "Specifies if the instance is preemptible. Defaults to false."
  type        = bool
  default     = false
}


// Instance network interface
variable "nat" {
  description = "Provide a public address, for instance, to access the internet over NAT."
  type        = bool
  default     = true
}
variable "subnet_id" {
  description = "ID of the subnet to attach this interface to. The subnet must exist in the same zone where this instance will be created."
  type        = string
}
