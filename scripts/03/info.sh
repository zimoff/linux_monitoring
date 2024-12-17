#!/bin/bash

HOSTNAME=$(hostname) #сетевое имя
TIMEZONE=$(timedatectl | grep 'Time zone' | awk '{print $3 " UTC "}')$(date +"%:::z" | awk '{printf "%+d", $1}') #временная зона в виде: America/New_York UTC -5 
USER=$(whoami) #текущий пользователь который запустил скрипт
OS=$(sed '1!d' /etc/issue | awk '{print $1,$2,$3}') #тип и версия операционной системы
DATE=$(date +"%d %b %Y %T") #текущее время в виде: 12 May 2020 12:24:36
UPTIME=$(uptime |awk '{print $3}' | grep -o -E "[[:digit:]]{1,2}:?[[:digit:]]{0,2}") #[[:digit:]]{0,1,2}") #время работы системы
UPTIME_SEC=$(sed '1!d' /proc/uptime | awk '{print $1}') #время работы системы в секундах
NET=$(ip -4 route | grep -m 1 src  | awk 'BEGIN {RS=" "} {if ($0 ~ /[0-9]/) print}' | grep -m 1 -o -E "([0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})") #ip-адрес машины в любом из сетевых интерфейсов
IP=$(hostname -I)
MASK=$(netstat -r | grep $NET | awk '{print $3}') #сетевая маска любого из сетевых интерфейсов в виде: xxx.xxx.xxx.xxx
GATEWAY=$(ip route |awk '{if ($1 ~ /default/) print $3}') #ip шлюза по умолчанию
RAM_TOTAL=$(free --mega | awk '{if($1 ~ /Mem:/) printf"%.3f",$2/1024}') #размер оперативной памяти в Гб c точностью три знака после запятой в виде: 3.125 GB
RAM_USED=$(free --mega|awk '{if ($1 ~ /Mem:/) printf"%.3f",$3/1024}') #размер используемой памяти в Гб c точностью три знака после запятой
RAM_FREE=$(free --mega |awk '{if ($1 ~ /Mem:/) printf"%.3f",$4/1024}') #размер свободной памяти в Гб c точностью три знака после запятой
SPACE_ROOT=$(df -BK / | sed '2!d' | awk '{printf"%.3f", $2/1024}') #размер рутового раздела в Mб с точностью два знака после запятой в виде: 254.25 MB
SPACE_ROOT_USED=$(df -BK / | sed '2!d' | awk '{printf"%.3f", $3/1024}') #размер занятого пространства рутового раздела в Mб с точностью два знака после запятой
SPACE_ROOT_FREE=$(df -BK / | sed '2!d' | awk '{printf"%.3f", $4/1024}') #размер свободного пространства рутового раздела в Mб с точностью два знака после запятой

function get_info {
    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $TIMEZONE"
    echo "USER = $USER"
    echo "OS = $OS"
    echo "DATE = $DATE"
    echo "UPTIME = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP = $IP"
    echo "NET = $NET"
    echo "MASK = $MASK"
    echo "GATEWAY = $GATEWAY"
    echo "RAM_TOTAL = $RAM_TOTAL GB"
    echo "RAM_USED = $RAM_USED GB"
    echo "RAM_FREE = $RAM_FREE GB"
    echo "SPACE_ROOT = $SPACE_ROOT MB"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED MB"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE MB"
}
