curl -X POST https://sandbox.2checkout.com/checkout/api/1/901248156/rs/authService \
    -d '{"sellerId": "901407450", "privateKey": "0DB8222E-8F5D-4DB1-A1AD-CE41B9D6AFC3", "merchantOrderId": "123", "token": "MGJlYzk1YWQtMmU3MS00OTllLWFmMDYtODBhZmJlZDc2ODQ0", "currency": "USD", "lineItems": [{"name": "Demo Item", "price": "4.99", "type": "product", "quantity": "1", "recurrence": "4 Year", "startupFee": "9.99"}  ], "billingAddr": {"name": "testing tester", "addrLine1": "123 test blvd", "city": "columbus", "state": "Ohio", "zipCode": "43123", "country": "USA", "email": "example@2co.com", "phoneNumber": "123456789"} }' \
    -H 'Accept: application/json' -H 'Content-Type: application/json'