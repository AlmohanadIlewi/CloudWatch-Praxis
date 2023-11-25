
# Provides an EC2 instance resource

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "grafana_ec2" {
    ami           = data.aws_ami.ubuntu.id
    instance_type = "t3.micro"
    associate_public_ip_address = true 
    key_name = "accesskey"
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids =  [aws_security_group.grafana_ssh_sg.id]


    # security_groups = [aws_security_group.grafana_ssh_sg.id]  # Use the security group ID you want to associate


  tags = {
    Name = "grafana-ec2"
  }
}

resource "aws_security_group" "grafana_ssh_sg" {
  name        = "grafana_ssh_sg"
  description = "grafana_ssh_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    ingress {
    description      = "Grafana"
    from_port        = 3333
    to_port          = 3333
    protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "grafana_sg"
  }
}