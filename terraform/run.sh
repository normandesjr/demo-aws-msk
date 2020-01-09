#!/bin/bash

echo "Provisioning infrastructure..."

echo "Finding my public ip address..."
MY_PUBLIC_IP="$(curl -s https://ipinfo.io/ip)"
echo "... your public ip is $MY_PUBLIC_IP"

echo "Starting terraform..."
terraform apply -var "my_public_ip=$MY_PUBLIC_IP/32"