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

Error: Invalid multi-line string: Quoted strings may not be split over multiple lines. To produce a multi-line string, either use the 
 escape to represent a newline character or use the "heredoc" multi-line template syntax. (and 33 other messages)

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-network/blob/master/LICENSE) for full details.
