#!/usr/bin/env bash

sudo apt install shadowsocks

sudo ./bbr.sh

# only for ubuntu on vultr.com
# hostip=`ifconfig ens3 |grep "inet " |awk '{print $2}'`


hostip=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
sed -i "s/8.8.8.8/$hostip/g" shadowsocks.json

# start server
sudo ssserver -c shadowsocks.json -d start
