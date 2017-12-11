#!/bin/sh

set -e

function die {
    echo "FAILURE"
    exit
}

# Fetch test key. This is a TEST KEY set up specifically for this purpose.
curl -qo ~/.ssh/id_rsa http://scratch.caseyfulton.com/files/id_rsa || die
chmod 600 ~/.ssh/id_rsa

# PHP test.
git clone git@github.com:symfony/demo.git /symfony-demo || die
cd /symfony-demo
composer install || die
cd /

# JS test.
npm install -g create-react-app || die
create-react-app /react-app || die

# JQ test.
curl -i -X POST --header "Content-Type: text/xml" -d '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/"><soap:Header><ns5:ContractVersion xmlns:ns5="http://schemas.navitaire.com/WebServices" xmlns="http://schemas.navitaire.com/WebServices/DataContracts/Utilities">1</ns5:ContractVersion></soap:Header><soap:Body><ns2:GetMarketListRequest xmlns="http://schemas.navitaire.com/WebServices/DataContracts/Utilities" xmlns:ns2="http://schemas.navitaire.com/WebServices/ServiceContracts/UtilitiesService" /></soap:Body></soap:Envelope>' https://jqtestr3xapi.navitaire.com/UtilitiesManager.svc || die

echo "SUCCESS"
