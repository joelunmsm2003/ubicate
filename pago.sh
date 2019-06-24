
#!/bin/bash

token="$1"

monto="$2"

book="$3"

echo $token;

curl -X POST https://sandbox.2checkout.com/checkout/api/1/901407450/rs/authService \
	-d '{"sellerId": "901407450", "privateKey": "0DB8222E-8F5D-4DB1-A1AD-CE41B9D6AFC3", "merchantOrderId": "'${book}'", "token": "'${token}'", "currency": "USD", "lineItems": [{"name": "Demo Item", "price": "'${monto}'", "type": "product", "quantity": "1", "recurrence": "4 Year", "startupFee": "9.99"}  ], "billingAddr": {"name": "testing tester", "addrLine1": "123 test blvd", "city": "columbus", "state": "Ohio", "zipCode": "43123", "country": "USA", "email": "example@2co.com", "phoneNumber": "123456789"} }' \
	-H 'Accept: application/json' -H 'Content-Type: application/json' > response.txt


echo 'Enviando datos al server'


cat response.txt

file_contents=$(cat response.txt)


echo '----------------------------------'
echo $file_contents;


curl -i -X POST -H "Content-Type: application/json" -d "{\"key\":\"'${file_contents}'\"}"  http://ec2-18-221-248-184.us-east-2.compute.amazonaws.com:8000/respuestapago/