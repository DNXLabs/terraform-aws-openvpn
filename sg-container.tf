resource "aws_security_group" "openvpn_internet_ingress" {
  name   = "${var.name}-internet-ingress"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
