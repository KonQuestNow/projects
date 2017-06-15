#!/bin/bash

clear

echo "This script will perform a CLEAN installation of the API-C Stack."
echo "All previous docker data may be lost. Do you wish to continue?"
echo

select yn in "Yes" "No"; do
    case $yn in
        Yes )

echo
echo
echo

echo STEP 1 - STOPPING RUNNING CONTAINERS:
echo -----

docker stop $(docker ps -a -q)

echo
echo
echo -ne '▓▓▓▓▓                     (33%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓             (66%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   (100%)\r'
echo -ne '\n'

echo "done."
echo
echo
echo

echo STEP 2 - REMOVING STOPPED CONTAINERS:
echo -----

docker rm $(docker ps -a -q)

echo
echo
echo -ne '▓▓▓▓▓                     (33%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓             (66%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   (100%)\r'
echo -ne '\n'

echo "done."
echo
echo
echo

docker rmi $(docker images -q)

echo
echo
echo -ne '▓▓▓▓▓                     (33%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓             (66%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   (100%)\r'
echo -ne '\n'

echo "done."
echo
echo
echo



echo STEP 3 - DEPLOYING CASSANDRA:
echo -----

docker run -d -it --name kong-database \
              -p 9042:9042 \
              cassandra:2.2

echo


echo "done."
echo
echo
echo



echo STEP 4 - DEPLOYING KONG:
echo -----

docker run  -P -d -it --name kong \
              --link kong-database:kong-database \
              -e "KONG_DATABASE=cassandra" \
              -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
              -e "KONG_PG_HOST=kong-database" \
              -p 8000:8000 \
              -p 8443:8443 \
              -p 8001:8001 \
              -p 7946:7946 \
              -p 7946:7946/udp \
              kong:latest

echo


echo "done."
echo
echo
echo


echo STEP 5 - DEPLOYING KONGA ADMIN:
echo -----
#docker run -dit --name konga -p 5000:5000 -p 1338:1338 -e KONGA_BACKEND_URL=http://127.0.0.1:1338 --link kong:kong pantsel/konga
#
docker run -d -it --name konga \
              -p 5000:5000 \
              -p 1337:1337 \
              -e "KONGA_BACKEND_URL=http://127.0.0.1:1337" \
              --link kong:kong \
              pantsel/konga

echo


echo "done."
echo
echo
echo

echo STEP 6 - DEPLOYMENT COMPLETE
echo -----

docker ps -a

echo
echo
echo
echo LOADING 'KONG ADMIN'
echo
echo
echo -ne '▓▓▓▓▓                     (33%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓             (66%)\r'
sleep 1
echo -ne '▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓   (100%)\r'
echo -ne '\n'

echo "done."
echo
echo
echo

echo "KONG ADMIN LOADED => http://127.0.0.1:1337"

echo
echo
echo

wait; break;;
        No ) exit;;
    esac
done
