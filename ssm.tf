resource "aws_ssm_parameter" "ROUTE_PUSH" {
  name  = "/openvpn-${var.name}/ROUTE_PUSH"
  type  = "String"
  value = var.route_push
}

resource "aws_ssm_parameter" "DOMAIN_NAME" {
  name  = "/openvpn-${var.name}/DOMAIN_NAME"
  type  = "String"
  value = var.domain_name
}

resource "aws_ssm_parameter" "USERS" {
  name  = "/openvpn-${var.name}/USERS"
  type  = "String"
  value = ","
  lifecycle {
    ignore_changes = [value]
  }
}

resource "aws_ssm_parameter" "REVOKE_USERS" {
  name  = "/openvpn-${var.name}/REVOKE_USERS"
  type  = "String"
  value = ","
  lifecycle {
    ignore_changes = [value]
  }
}
