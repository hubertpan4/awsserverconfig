#!/bin/bash
sudo yum update
sudo yum upgrade install -y
sudo yum install java -y
sudo yum install -y aws-cli
echo "Attempting to list S3 bucket: com.icarusfrog.us.east.2.code.bucket" >> /var/log/cloud-init-output.log
#aws s3 ls s3://com.icarusfrog.us.east.2.code.bucket/ >> /var/log/cloud-init-output.log 2>&1
aws s3 cp s3://com.icarusfrog.us.east.2.code.bucket/aws-demo-0.0.1-SNAPSHOT.jar bob.jar --debug --endpoint-url http://s3.dualstack.us-east-2.amazonaws.com/
export SPRING_PROFILES_ACTIVE=aws,debug
touch bob.txt
java -jar bob.jar -Dspring.profiles.active=aws >> bob.txt
# aws s3 cp s3://com.icarusfrog.us.east.2.code.bucket/aws-demo-0.0.1-SNAPSHOT.jar bob.jar
# wget https://github.com/hubertpan3/aws-demo/releases/download/0.0.1/aws-demo-0.0.1-SNAPSHOT.jar
# aws s3 cp s3://com.icarusfrog.us.east.2.code.bucket/aws-demo-0.0.1-SNAPSHOT.jar bob.jar --debug --endpoint-url http://s3.dualstack.us-east-2.amazonaws.com/
# java -jar aws-demo-0.0.1-SNAPSHOT.jar
# sudo yum install nginx
# sudo systemctl start nginx