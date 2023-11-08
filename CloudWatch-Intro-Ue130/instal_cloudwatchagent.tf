# Shell-Script zur Installation des CloudWatch Agents
# data "template_file" "install_cloudwatch_agent_script" {
#   template = <<-EOT
#     #!/bin/bash
#     sudo yum install -y amazon-cloudwatch-agent
#   EOT
# }

# resource "null_resource" "install_cloudwatch_agent" {
#   triggers = {
#     script = data.template_file.install_cloudwatch_agent_script.rendered
#   }

# }
