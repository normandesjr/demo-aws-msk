resource "aws_instance" "instances" {
  ami = "ami-062f7200baf2fa504"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.subnet_az1.id

  key_name = "terraform"

  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"
    , "${aws_security_group.allow_outbound.id}"]

}

output "instances" {
  value = "${aws_instance.instances.public_ip}"
}