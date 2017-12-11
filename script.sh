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

# Java test.
# ???

echo "SUCCESS"
