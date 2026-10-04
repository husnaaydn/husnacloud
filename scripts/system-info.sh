#!/bin/bash

echo "===== HusnaCloud Sistem Bilgisi ====="

echo "Kullanici: $(whoami)"
echo "Tarih: $(date)"
echo "Bulundugun dizin: $(pwd)"
echo "Bilgisayar adi: $(hostname)"
echo "Linux kernel: $(uname -r)"

echo "===== Disk Kullanimi ====="
df -h / 

echo ""
echo "====== RAM Durum Kontrolu ======"

RAM_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "RAM kullanimi: %$RAM_USAGE"


if [ "$RAM_USAGE" -ge 80 ]; then
    echo "UYARI: RAM kullanimi yuksek!"
else 
    echo "RAM durumu: NORMAL"
fi



echo ""
echo "====RAM Kullanimi===="
free -h


echo ""
echo "====CPU Bilgisi===="
lscpu | grep "Model name"



echo ""
echo "====En Cok RAM Kullanan 5 Process===="

ps aux --sort=-%mem | head -n 6

echo ""
echo "====== Disk Durum Kontrolu ======"

DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo "Disk Kullanimi: %$DISK_USAGE"


if [ "$DISK_USAGE" -ge 80 ]; then
    echo "UYARI : Disk Kullanimi Yuksek!"
else
    echo "Durum: Normal"
fi
