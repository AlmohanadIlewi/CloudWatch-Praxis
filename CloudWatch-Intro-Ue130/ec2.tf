terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "techstarter"
}
resource "aws_security_group" "cloudwatch-sg" {
  name        = "cloudwatch_instance_sg"
  description = "Allow SSH, HTTP inbound traffic"


  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "kp" {
  key_name   = "Metricskey"
  public_key = file("Metricskey.pub")
}

resource "aws_instance" "metricsInstance-cloudwatch" {
  ami             = "ami-0a485299eeb98b979"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.cloudwatch-sg.name]
  key_name        = aws_key_pair.kp.key_name
  monitoring      = true # Enable Detailed CloudWatch Monitoring
  disable_api_termination = true # Disable termination protection
  tags = {
    Name = "metricsInstance"
  }
}

output "instance_id" {
    value = aws_instance.metricsInstance-cloudwatch.id
    description = "EC2 Instance ID"
}


# output "instance_id" {
#     value = {
#         value1 = aws_instance.metricsInstance-cloudwatch.MetricskKey.pem
#         description = "EC2 details"
#     }
# }
