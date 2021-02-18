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
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | n/a | `any` | n/a | yes |
| domain\_name | Domain name to point to openvpn container for external access | `string` | `"vpn.address"` | no |
| image | n/a | `string` | `"dnxsolutions/openvpn:2.2.2"` | no |
| mfa | Enable or disable MFA for VPN users | `string` | `"false"` | no |
| name | Name of your ECS service | `string` | `"default"` | no |
| requester\_cidrs | List of CIDRs to add to openvpn-access SG so clients can connect to resources | `list(string)` | `[]` | no |
| route\_push | List of routes to push to client, comma-separated (ex: '10.100.0.0 255.255.0.0,10.200.0.0 255.255.0.0') | `string` | `""` | no |
| task\_role\_arn | n/a | `any` | n/a | yes |
| vpc\_id | n/a | `any` | n/a | yes |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-network/blob/master/LICENSE) for full details.
