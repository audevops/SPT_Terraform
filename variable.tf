variable "subscription_id" {
  type        = string
  description = "Enter here the subscription id"
  default     = "80ea84e8-afce-4851-928a-9e2219724c69"
}
variable "tenant_id" {
  type        = string
  description = "Enter here the Tenant id"
  default     = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
}
variable "client_secret" {
  type        = string
  description = "Enter here the subscription id"
  default     = "uDp8Q~OA72nxmuovzJ9ZK7Id-BuT_KqRvNRx6auT"
}
variable "client_id" {
  type        = string
  description = "Enter here the Client id"
  default     = "be2d1fca-b7b7-4b98-b0d5-a77ddbf8828d"
}
variable "resource_group_name" {
  type        = string
  description = "Enter here the Resource Group"
  default     = "1-7996a50d-playground-sandbox"
}
variable "location" {
  type        = string
  description = "Enter here the location"
  default     = "East US"
}

variable "virtual_network" {
  type        = string
  description = "Enter here the location"
  default     = "DB_VNET"
}
variable "virtual_machine" {
  type        = string
  description = "Enter here the location"
  default     = "DB1"
}
variable "network_interface" {
  type        = string
  description = "Enter here the location"
  default     = "DB1_NIC"
}
variable "Subnet" {
  type        = string
  description = "Enter here the location"
  default     = "DB_SUBNET"
}
variable "Public_IP" {
  type        = string
  description = "DB1_PUB"
  default     = "a394e41c-cf8d-458e-ac1b-ddae1aa15629"
}