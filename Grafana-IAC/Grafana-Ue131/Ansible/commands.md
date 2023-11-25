 # Configure with Ansible!

- die Verbindung von Grafana zu CloudWatch eingerichtet werden.

- sudo ansible-playbook -i hosts playbooks/grafana.yml

- sudo ansible-playbook -i hosts playbooks/main.yml

- ubuntu@ip-xx-x-x-xx:~$ sudo apt install net-tools

- :~$ netstat -plnt

- sudo systemctl status grafana-server

- ubuntu@ip-xx-x-x-xx:/etc/grafana$ sudo cat grafana.ini | grep http_port


#####################################################

#  Connect to AWS!

- die Verbindung von Grafana zu CloudWatch eingerichtet werden.

- ubuntu@ip-xx-xx-x-xx:cd /usr/share/grafana$

 - /usr/share/grafana$ ls

- :/usr/share/grafana$ sudo mkdir .aws

- :/usr/share/grafana$ cd .aws/

- :/usr/share/grafana/.aws$ sudo touch credentials

- :/usr/share/grafana/.aws$ sudo nano credentials

- :/usr/share/grafana/.aws$ sudo nano credentials # in dieser datei geben wir von Sandbox,

- Option 2: Manually add a profile to your AWS credentials file (Short-term credentials)”.

- Ersetzen den Profilnamen mit “default”. Die Datei sollte dann so aussehen:
- [default]

- aws_access_key_id=ASIA[...]

* aws_secret_access_key=m2LKaNh[...]

* aws_session_token=IQoJb3JpZ2luX[...]


