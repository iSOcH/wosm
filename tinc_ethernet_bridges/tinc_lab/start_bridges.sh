#!/bin/bash

echo creating bridges...
brctl addbr brv_10
brctl addbr brv_20
brctl addbr brv_30
brctl addbr brv_40
brctl addbr brv_110
brctl addbr brv_120

echo adding vlan subinterfaces
ip link add link eth0 name eth0.10 type vlan id 10
ip link add link eth0 name eth0.20 type vlan id 20
ip link add link eth0 name eth0.30 type vlan id 30
ip link add link eth0 name eth0.40 type vlan id 40
ip link add link eth0 name eth0.110 type vlan id 110
ip link add link eth0 name eth0.120 type vlan id 120

echo configuring local links...
sleep 1
ifconfig eth0.10 0.0.0.0
ifconfig eth0.20 0.0.0.0
ifconfig eth0.30 0.0.0.0
ifconfig eth0.40 0.0.0.0
ifconfig eth0.110 0.0.0.0
ifconfig eth0.120 0.0.0.0

echo bringing up bridges...
ifconfig brv_10 up
ifconfig brv_20 up
ifconfig brv_30 up
ifconfig brv_40 up
ifconfig brv_110 up
ifconfig brv_120 up

echo adding local ifs to bridges...
sleep 1
brctl addif brv_10 eth0.10
brctl addif brv_20 eth0.20
brctl addif brv_30 eth0.30
brctl addif brv_40 eth0.40
brctl addif brv_110 eth0.110
brctl addif brv_120 eth0.120

echo enabling local links...
sleep 1
ifconfig eth0.10 up
ifconfig eth0.20 up
ifconfig eth0.30 up
ifconfig eth0.40 up
ifconfig eth0.110 up
ifconfig eth0.120 up

echo starting tinc daemons...
sleep 1
tincd -n bridge_10
sleep 1
tincd -n bridge_20
sleep 1
tincd -n bridge_30
sleep 1
tincd -n bridge_40
sleep 1
tincd -n bridge_110
sleep 1
tincd -n bridge_120
