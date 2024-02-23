# terraform-aws-openvpn

[![Lint Status](https://github.com/DNXLabs/terraform-aws-openvpn/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-openvpn/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-openvpn)](https://github.com/DNXLabs/terraform-aws-openvpn/blob/master/LICENSE)

This module setup an OpenVPN installation and requires an existing VPC.

The following resources will be created:

 - Elastic Container Service(ECS) 
 - Network Load Balance
 - Tasks Definition
 - ECS Service
 - IAM roles for the ECS Tasks
 - Cloudwatch log group for the ECS
 - S3 Bucket to save the ECS Openvpn logs
 - Security group for the openvpn access
 - SSM Parameter resources (Domain Name, Users, Route Push and Revoke Users).

 In addition you have the option to:
 - Enable or disable Multi-Factor Authentication (MFA) 

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 4.4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.4.0 |
| random | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_ssl\_policy | The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS. | `string` | `"ELBSecurityPolicy-2016-08"` | no |
| architecture | Architecture to select the AMI, x86\_64 or arm64 | `string` | `"x86_64"` | no |
| asg\_protect\_from\_scale\_in | (Optional) Allows setting instance protection. The autoscaling group will not select instances with this setting for termination during scale in events. | `bool` | `false` | no |
| asg\_target\_capacity | Target average capacity percentage for the ECS capacity provider to track for autoscaling. | `number` | `70` | no |
| autoscaling\_default\_cooldown | The amount of time, in seconds, after a scaling activity completes before another scaling activity can start. | `number` | `300` | no |
| autoscaling\_health\_check\_grace\_period | The length of time that Auto Scaling waits before checking an instance's health status. The grace period begins when an instance comes into service. | `number` | `300` | no |
| backup | Assing a backup tag to efs resource - Backup will be performed by AWS Backup. | `string` | `"true"` | no |
| cw\_retention\_period | Retention period (in days) for Cloud Watch log group. Default to Never Expire. | `number` | `0` | no |
| domain\_name | Domain name to point to openvpn container for external access | `string` | `"vpn.address"` | no |
| hosted\_zone | Hosted Zone to create DNS record for this app | `string` | `""` | no |
| hosted\_zone\_id | Hosted Zone ID to create DNS record for this app (prefer this instead of hosted\_zone) | `string` | `""` | no |
| hostname\_create | Optional parameter to create or not a Route53 record | `string` | `"true"` | no |
| image | VPN\_SERVICE | `string` | `"dnxsolutions/openvpn:2.4.0"` | no |
| instance\_type\_1 | Instance type for ECS workers (first priority). | `any` | n/a | yes |
| instance\_type\_2 | Instance type for ECS workers (second priority). | `any` | n/a | yes |
| instance\_type\_3 | Instance type for ECS workers (third priority). | `any` | n/a | yes |
| instance\_volume\_size | Volume size for docker volume (in GB). | `number` | `30` | no |
| instance\_volume\_size\_root | Volume size for root volume (in GB). | `number` | `16` | no |
| kms\_key\_ebs\_arn | ARN of a KMS Key to use on EBS volumes | `string` | `""` | no |
| kms\_key\_efs\_arn | ARN of a KMS Key to use on EFS volumes | `string` | `""` | no |
| kms\_key\_s3\_arn | ARN of a KMS Key to use on S3 buckets | `string` | `""` | no |
| lb\_access\_logs\_bucket | Bucket to store logs from lb access. | `string` | `""` | no |
| lb\_access\_logs\_prefix | Bucket prefix to store lb access logs. | `string` | `""` | no |
| mfa | Enable or disable MFA for VPN users | `string` | `"false"` | no |
| name | Name of this ECS cluster. | `any` | n/a | yes |
| nlb\_security\_group\_ids | Extra security groups for instances. | `list(string)` | `[]` | no |
| on\_demand\_base\_capacity | You can designate a base portion of your total capacity as On-Demand. As the group scales, per your settings, the base portion is provisioned first, while additional On-Demand capacity is percentage-based. | `number` | `0` | no |
| on\_demand\_percentage | Percentage of on-demand intances vs spot. | `number` | `0` | no |
| private\_subnet\_ids | List of private subnet IDs for ECS instances and Internal ALB when enabled. | `list(string)` | n/a | yes |
| protocol | Protocol that will be use by the vpn | `string` | `"tcp"` | no |
| provisioned\_throughput\_in\_mibps | The throughput, measured in MiB/s, that you want to provision for the file system. | `number` | `0` | no |
| public\_subnet\_ids | List of public subnet IDs for ECS ALB. | `list(string)` | n/a | yes |
| requester\_cidrs | List of CIDRs to add to openvpn-access SG so clients can connect to resources | `list(string)` | `[]` | no |
| route\_push | List of routes to push to client, comma-separated (ex: '10.100.0.0 255.255.0.0,10.200.0.0 255.255.0.0') | `string` | `""` | no |
| s3\_bucket\_policy | Openvpn S3 bucket policy | `string` | `""` | no |
| secure\_subnet\_ids | List of secure subnet IDs for EFS. | `list(string)` | n/a | yes |
| security\_group\_ids | Extra security groups for instances. | `list(string)` | `[]` | no |
| target\_group\_arns | List of target groups for ASG to register. | `list(string)` | `[]` | no |
| throughput\_mode | Throughput mode for the file system. Defaults to bursting. Valid values: bursting, provisioned. | `string` | `"bursting"` | no |
| userdata | Extra commands to pass to userdata. | `string` | `""` | no |
| vpc\_id | VPC ID to deploy the ECS cluster. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| ecs\_nodes\_secgrp\_id | n/a |
| s3\_bucket\_openvpn | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-network/blob/master/LICENSE) for full details.
