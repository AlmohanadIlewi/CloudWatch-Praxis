import boto3
import time

# Verwende das AWS-Profil "techstarter" aus deiner AWS-Konfigurationsdatei
session = boto3.Session(profile_name="techstarter")

# Erstelle eine Verbindung zu CloudWatch
cloudwatch = session.client('cloudwatch', region_name='eu-central-1')

# Definiere die Metrik-Daten
namespace = "CWAgent"  # Ein Namespace, um deine Metriken zu organisieren
metric_name = "CPUUtilization"  # Der Name der Metrik
value = 42.0  # Der Wert der Metrik
unit = "Count"  # Die Einheit der Metrik
dimensions = [
    {
        'Name': 'InstanceID',
        'Value': 'i-12345678'  # Optional: Füge Dimensionen hinzu
    }
]

# Sende die Metrik an CloudWatch
response = cloudwatch.put_metric_data(
    Namespace=namespace,
    MetricData=[
        {
            'MetricName': metric_name,
            'Value': value,
            'Unit': unit,
            'Dimensions': dimensions,
            'Timestamp': int(time.time()),
        }
    ]
)

print("Metrik wurde an CloudWatch gesendet:")
print(response)