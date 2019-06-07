# == REQUIRED VARS

variable "name" {
  default     = "default"
  description = "Name of your ECS service"
}

variable "cluster_name" {}

variable "task_role_arn" {}

variable "vpc_id" {}

variable "image" {
  default = "dnxsolutions/openvpn:1.0.3"
}

variable "requester_cidrs" {
  default     = []
  type        = "list"
  description = "List of CIDRs to add to openvpn-access SG so clients can connect to resources"
}

variable "users" {
  default     = ""
  description = "List of users (comma-separated, no spaces) to create keys"
}

variable "revoke_users" {
  default     = ""
  description = "List of users (comma-separated, no spaces) to revoke previously created keys"
}

variable "domain_name" {
  default     = "vpn.address"
  description = "Domain name to point to openvpn container for external access"
}

variable "route_push" {
  default     = ""
  description = "List of routes to push to client, comma-separated (ex: '10.100.0.0 255.255.0.0,10.200.0.0 255.255.0.0')"
}
