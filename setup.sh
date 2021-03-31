#!/bin/bash

echo "start to initialize"
RET_CODE=0

yum update -y && \
    yum install -y epel-release && \
    yum install -y ansible && \
    yum install -y python-setuptools

if [ $? = 0 ]; then
    echo "yum install success"
else
    echo "yum install failed"
    RET_CODE=1
fi

ansible-playbook -i localhost, -c local /ansible/playbook.yml

if [ $? = 0 ]; then
    echo "ansible playbook install success"
else
    echo "ansible playbook install failed"
    RET_CODE=1
fi

if [ $RET_CODE = 0 ]; then
    echo "initialize has successed"
else
    echo "initialize has failed"
fi

exit $RET_CODE