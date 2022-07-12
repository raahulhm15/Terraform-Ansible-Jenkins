//security.tf
resource "aws_security_group" "ingress-all-test" {
name = "bastion1-host-sg"
vpc_id = module.vpc.vpc_id
ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =["${local.ifconfig_co_json.ip}/32"]
}
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
