resource "aws_ssm_parameter" "ROUTE_PUSH" {
  name  = "/openvpn/ROUTE_PUSH"
  type  = "String"
  value = "${var.route_push}"
}

resource "aws_ssm_parameter" "DOMAIN_NAME" {
  name  = "/openvpn/DOMAIN_NAME"
  type  = "String"
  value = "${var.domain_name}"
}

resource "aws_ssm_parameter" "USERS" {
  name  = "/openvpn/USERS"
  type  = "String"
  value = "${var.users} "
}

resource "aws_ssm_parameter" "REVOKE_USERS" {
  name  = "/openvpn/REVOKE_USERS"
  type  = "String"
  value = "${var.revoke_users} "
}
