!#/bin/bash

cd /home/ubicate

find /home/ubicate -name "*.csv" -type f -delete

curl -X POST -H "Authorization: Basic ZDMwNDdmMmEtZGExNy00ODQ4LTk3MGItYjBkMzI3NGI3ZWMz" -H "Content-Type: application/json" -d '{
    "extra_fields": ["location", "rooted", "ip", "country", "web_auth", "web_p256"], "last_active_since": "1469392779"
}' "https://onesignal.com/api/v1/players/csv_export?app_id=f9ffbe5b-5c2d-49c8-911a-9de515621b4e" > zipdevices.txt

cat /home/ubicate/zipdevices.txt > urldevices.txt

read VAR < '/home/ubicate/urldevices.txt'

IFS='" ' read -a array <<< "$VAR"

echo "Clientes ... ${array[3]}"

sleep 10

wget "${array[3]}"

echo "EXTRAYENDO... ${array[3]##*/}"

gzip -d  "${array[3]##*/}"

sleep 5

cp *.csv '/var/www/html/clientes.csv'

find /home/ubicate -name "*.csv" -type f -delete


