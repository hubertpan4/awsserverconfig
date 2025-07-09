#!/bin/bash
sudo yum update
sudo yum upgrade install -y
sudo yum install java
echo "Attempting to list S3 bucket: com.icarusfrog.test" >> /var/log/cloud-init-output.log
aws s3 ls s3://com.icarusfrog.test/ >> /var/log/cloud-init-output.log 2>&1
# wget https://github.com/hubertpan3/aws-demo/releases/download/0.0.1/aws-demo-0.0.1-SNAPSHOT.jar
# java -jar aws-demo-0.0.1-SNAPSHOT.jar
# sudo yum install nginx
# sudo systemctl start nginx