resource "aws_security_group" "allow_ssh" {
  vpc_id = "${aws_vpc.vpc.id}"
  name = "demo_allow_ssh"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.my_public_ip}"]
  }
}

resource "aws_security_group" "allow_outbound" {
  vpc_id = "${aws_vpc.vpc.id}"
  name = "demo_allow_outbound"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
