curl -s --user 'api:key-f5555435701e83ba461a84ea3724f52e' \
    https://api.mailgun.net/v3/sandboxbb5414fe26d94969aa76e2ece53f668e.mailgun.org/messages \
    -F from='Excited User postmaster@sandboxbb5414fe26d94969aa76e2ece53f668e.mailgun.org' \
    -F to=joelunmsm@gmail.com \
    -F subject='Hello' \
    -F text='Testing some Mailgun awesomness!'