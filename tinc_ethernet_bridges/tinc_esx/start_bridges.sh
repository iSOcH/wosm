#!/bin/bash

echo creating bridges...
brctl addbr brv_10
brctl addbr brv_20
brctl addbr brv_30
brctl addbr brv_40
brctl addbr brv_110
brctl addbr brv_120

echo configuring local links...
ifconfig eth1 0.0.0.0
ifconfig eth2 0.0.0.0
ifconfig eth3 0.0.0.0
ifconfig eth4 0.0.0.0
ifconfig eth5 0.0.0.0
ifconfig eth6 0.0.0.0

echo bringing up bridges...
ifconfig brv_10 up
ifconfig brv_20 up
ifconfig brv_30 up
ifconfig brv_40 up
ifconfig brv_110 up
ifconfig brv_120 up

echo adding local ifs to bridges...
sleep 1
brctl addif brv_10 eth1
brctl addif brv_20 eth2
brctl addif brv_30 eth3
brctl addif brv_40 eth4
brctl addif brv_110 eth5
brctl addif brv_120 eth6

echo enabling local links...
sleep 1
ifconfig eth1 up
ifconfig eth2 up
ifconfig eth3 up
ifconfig eth4 up
ifconfig eth5 up
ifconfig eth6 up

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
