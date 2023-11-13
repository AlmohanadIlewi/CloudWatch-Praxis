# EC2 Instanz zum Testen des Setupt

resource "aws_instance" "Ubuntu_Machine" {
  count                  = 2
  ami                    = var.instance_ami
  instance_type          = "t2.micro"
  # subnet_id              = var.subnet_ids[count.index]
  subnet_id              = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = var.key

  # tags = {
  #   Name = var.instance_names[count.index + 1] 
  # }
   tags = {
    Name = element(var.instance_names, count.index)
  }
}

variable "instance_names" {
  type    = list(string)
  default = ["Prometheus", "Node-Exporter"] 
}


# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
# resource "aws_instance" "Grafana_Prometheus" {
#   count                  = length(var.subnet_ids)
#   ami                    = var.instance_ami
#   instance_type          = "t2.micro"
#   subnet_id              = var.subnet_ids[count.index]
#   vpc_security_group_ids = [aws_security_group.sg.id]
#   key_name               = var.key


#   tags = {
#     Name = "EC2 ${count.index + 1}"
#   }

# }

