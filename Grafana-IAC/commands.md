Main commands:
  init          Prepare your working directory for other commands

  validate      Check whether the configuration is valid

  fmt           Reformat your configuration in the standard style

  plan          Show changes required by the current configuration

  apply         Create or update infrastructure

  destroy       Destroy previously-created infrastructure

    Path to key_pair.pem 
    
   # Path to Key "C:\Users\Al Mohanad Ilewi\Downloads\accesskey.pem"  

 - sudo ssh 3.69.24.130 -i "/mnt/c/Users/Al Mohanad Ilewi/Downloads/accesskey.pem" -l ubuntu

mohanad@AWSCloud:/mnt/c/Users/Al Mohanad Ilewi/Desktop/Cloudwatch-Practice/Grafana-IAC/Monitoring_Ue-132-133/ansible/playbooks$ sudo ansible-playbook -i inventories/production/hosts.ini site.yml
