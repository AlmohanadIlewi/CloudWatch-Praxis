output "ec2_ip" {
  description = "EC2 IP addresses and names"
  value       = [for i in aws_instance.Ubuntu_Machine : "${i.public_ip} (${i.tags.Name})"]
}

# output "ec2_ip" {
#   description = "EC2 IP"
#   value       = aws_instance.Grafana_Prometheus.*.public_ip
# }

# output "ec2_ip" {
#   description = "EC2 IP addresses"
#   value       = aws_instance.Grafana_Prometheus[*].public_ip
# }
