#!/bin/bash

COUNT_eth0=0
COUNT_eth1=0

#ipaddr="$(ip -br a show dev eth0)"
#[ "${ipaddr/192.168.210.2/}" = "$ipaddr" ] && ip a add 192.168.210.2/24 dev eth0

while [ 1 ];do
    sleep 60
    #[ "${ipaddr/192.168.210.2/}" = "$ipaddr" ] && ip a add 192.168.210.2/24 dev eth0

    #CHECK=$(ip a show eth0|grep -c "inet ")
    CHECK="$(ip -br a show dev eth0)"
    if [ "${CHECK/101.200}" = "${CHECK}" ]; then
        COUNT_eth0=$(expr $COUNT_eth0 + 1)
        if [ $COUNT_eth0 -gt 4 ]; then
            sudo ifdown eth0 >/dev/null 2>&1
            sleep 1
            sudo ifup eth0 >/dev/null 2>&1
            COUNT_eth0=0
            ipaddr="$(ip -br a show dev eth0)"
        fi
    else
        COUNT_eth0=0
    fi

    #CHECK=$(ip a show eth1|grep -c "inet ")
    CHECK="$(ip -br a show dev eth1)"
    if [ "${CHECK/10.250.96}" = "${CHECK}" ]; then
        COUNT_eth1=$(expr $COUNT_eth1 + 1)
        if [ $COUNT_eth1 -gt 4 ]; then
            sudo ifdown eth1 >/dev/null 2>&1
            sleep 1
            sudo ifup eth1 >/dev/null 2>&1
            COUNT_eth1=0
        fi
    else
        COUNT_eth1=0
    fi

done