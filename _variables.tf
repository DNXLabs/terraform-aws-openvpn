# == REQUIRED VARS

variable "name" {
  description = "Name of this ECS cluster."
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of a KMS Key to use on EFS and EBS volumes"
  default     = ""
}

variable "throughput_mode" {
  type        = string
  default     = "bursting"
  description = "Throughput mode for the file system. Defaults to bursting. Valid values: bursting, provisioned."
}

variable "provisioned_throughput_in_mibps" {
  default     = 0
  description = "The throughput, measured in MiB/s, that you want to provision for the file system."
}

variable "backup" {
  type        = string
  default     = "true"
  description = "Assing a backup tag to efs resource - Backup will be performed by AWS Backup."
}

variable "vpc_id" {
  description = "VPC ID to deploy the ECS cluster."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for ECS instances and Internal ALB when enabled."
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs for ECS ALB."
}

variable "secure_subnet_ids" {
  type        = list(string)
  description = "List of secure subnet IDs for EFS."
}

variable "instance_type_1" {
  description = "Instance type for ECS workers (first priority)."
}

variable "instance_type_2" {
  description = "Instance type for ECS workers (second priority)."
}

variable "instance_type_3" {
  description = "Instance type for ECS workers (third priority)."
}

variable "instance_volume_size" {
  description = "Volume size for docker volume (in GB)."
  default     = 30
}

variable "instance_volume_size_root" {
  description = "Volume size for root volume (in GB)."
  default     = 16
}

variable "on_demand_base_capacity" {
  description = "You can designate a base portion of your total capacity as On-Demand. As the group scales, per your settings, the base portion is provisioned first, while additional On-Demand capacity is percentage-based."
  default     = 0
}

variable "on_demand_percentage" {
  description = "Percentage of on-demand intances vs spot."
  default     = 0
}

variable "architecture" {
  default     = "x86_64"
  description = "Architecture to select the AMI, x86_64 or arm64"
}

# variable "certificate_arn" {}


# == OPTIONAL VARS

variable "userdata" {
  default     = ""
  description = "Extra commands to pass to userdata."
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "Extra security groups for instances."
}

variable "asg_protect_from_scale_in" {
  default     = false
  description = "(Optional) Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events."
}

variable "target_group_arns" {
  default     = []
  type        = list(string)
  description = "List of target groups for ASG to register."
}

variable "autoscaling_health_check_grace_period" {
  default     = 300
  description = "The length of time that Auto Scaling waits before checking an instance's health status. The grace period begins when an instance comes into service."
}

variable "autoscaling_default_cooldown" {
  default     = 300
  description = "The amount of time, in seconds, after a scaling activity completes before another scaling activity can start."
}

variable "asg_target_capacity" {
  default     = 70
  description = "Target average capacity percentage for the ECS capacity provider to track for autoscaling."
}

variable "lb_access_logs_bucket" {
  type        = string
  default     = ""
  description = "Bucket to store logs from lb access."
}

variable "lb_access_logs_prefix" {
  type        = string
  default     = ""
  description = "Bucket prefix to store lb access logs."
}

variable "alb_ssl_policy" {
  default     = "ELBSecurityPolicy-2016-08"
  type        = string
  description = "The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS."
}


# VPN_SERVICE
variable "image" {
  default = "dnxsolutions/openvpn:2.2.2"
}

variable "requester_cidrs" {
  default     = []
  type        = list(string)
  description = "List of CIDRs to add to openvpn-access SG so clients can connect to resources"
}

variable "domain_name" {
  default     = "vpn.address"
  description = "Domain name to point to openvpn container for external access"
}

variable "route_push" {
  default     = ""
  description = "List of routes to push to client, comma-separated (ex: '10.100.0.0 255.255.0.0,10.200.0.0 255.255.0.0')"
}

variable "mfa" {
  default     = "false"
  description = "Enable or disable MFA for VPN users"
}