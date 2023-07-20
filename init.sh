#!/bin/bash
apt-get update
apt-get install unzip -y
apt-get install awscli -y
snap install yq 
apt-get install moreutils -y
apt-get install docker -y
apt-get install docker-compose -y
apt-get install nginx -y
apt-get install ufw -y

systemctl stop nginx

echo "******** SETTING ENV VAR ********"
export AWS_ACCESS_KEY_ID=${s3key}
export AWS_SECRET_ACCESS_KEY=${s3secret}

echo "******** CREATING AWS FILES ********"
mkdir /home/ubuntu/.aws
cat <<EOF > /home/ubuntu/.aws/credentials
[default]
aws_access_key_id = ${s3key}
aws_secret_access_key = ${s3secret}
EOF
cat <<EOF > /home/ubuntu/.aws/config
[default]
region=us-east-1
output=json
EOF

echo "******** CLONE CTF REPO ********"
git clone -b 3.5.2 https://github.com/CTFd/CTFd.git

echo "******** FETCH S3 OBJECTS ********"
aws s3api get-object --bucket ctf-objects --key multiple_choice.zip ./multiple_choice.zip

echo "******** FETCH CTF BUILD FILE ${importFile} ********"
aws s3api get-object --bucket ctf-objects --key ${importFile} /CTFd/CTFd/ctf_build.zip

echo "******** UNZIP PLUGIN ********"
unzip ./multiple_choice.zip -d /CTFd/CTFd/plugins/

echo "******** FETCH THEME ********"
cd /CTFd/CTFd/themes
git clone https://github.com/CTFd/core-beta.git

echo "******** START CTF ********"
cd /CTFd
docker-compose up -d
sleep 60

echo "******** IMPORT CTF BUILD ********"
docker exec ctfd_ctfd_1 /bin/bash -c "python3 manage.py import_ctf ./CTFd/ctf_build.zip"
echo "******** SET CTF THEME ********"
docker exec ctfd_ctfd_1 /bin/bash -c "python3 manage.py set_config ctf_theme core-beta"
echo "******** SLEEP ********"
sleep 30
echo "******** CD to core-beta theme and git checkout commit ********"
cd /CTFd/CTFd/themes/core-beta
git checkout 15291550067a98f9821ea46c8708f9af4c3211f8

