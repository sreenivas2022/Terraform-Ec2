# EC2 Instance
resource "aws_instance" "Terraform-Ec2" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app-install.sh")
  key_name = leela.pem
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id   ]
  tags = {
    "Name" = "EC2-Terraform"
  }
}
