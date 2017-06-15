!/bin/bash

clear

echo "This script will perform a CLEAN installation of the API-C Stack."
echo "All previous docker data may be lost. Do you wish to continue?"

echo
echo

select yn in "Yes" "No"; do
    case $yn in
        Yes )

echo
echo

echo -----
echo STEP 1 - STOPPING RUNNING CONTAINERS:
echo -----

echo
echo

sudo docker stop $(sudo docker ps -a -q)

echo
echo

echo "done."

echo
echo

echo -----
echo STEP 2 - REMOVING STOPPED CONTAINERS:
echo -----

echo
echo

sudo docker rm $(sudo docker ps -a -q)

echo
echo

echo "done."

echo
echo

sudo docker rmi $(sudo docker images -q)

echo
echo

sudo docker ps -a

echo
echo

echo "done."

echo
echo

echo "Connecting to Docker Hub Private Repo:"

sudo docker login

echo -----
echo STEP 3 - DEPLOYING CASSANDRA:
echo -----

echo
echo

#gzcat images/kong-db/kong-db.tar | docker load

wait $!


echo
echo

echo "Running Image"

echo
echo

sudo docker run -d -it --name kong-database \
              -v ~/local/volumes/kong:/var/lib/cassandra \
              -p 9042:9042 \
              britian/rakuten:kongDB 

echo
echo


sudo docker ps -a

echo
echo

echo "done."

echo
echo

echo -----
echo STEP 4 - DEPLOYING KONG:
echo -----

echo
echo

#gzcat images/kong/kong.tar | docker load

echo
echo

wait $!


echo
echo

echo "Running Image"

echo
echo

sudo docker run  -P -d -it --name kong \
              --link kong-database:kong-database \
              -e "KONG_DATABASE=cassandra" \
              -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
              -e "KONG_PG_HOST=kong-database" \
              -p 8000:8000 \
              -p 8443:8443 \
              -p 8001:8001 \
              -p 7946:7946 \
              -p 7946:7946/udp \
              britian/rakuten:kong \
              tail -f /dev/null

echo
echo

sudo docker ps -a

echo
echo

echo "done."

echo
echo

wait $!

echo
echo

echo -----
echo STEP 5 - DEPLOYING KONGA ADMIN:
echo -----

echo
echo

#gzcat images/konga/konga.tar | docker load

wait $!

echo
echo

echo
echo "Running Image"

echo
echo

sudo docker run  -d --name konga \
              -p 5000:5000 \
              -p 1337:1337 \
              -e "KONGA_BACKEND_URL=http://127.0.0.1:1337" \
              --link kong:kong \
              britian/rakuten:konga790 \
              tail -f /dev/null


wait $!

echo
echo

echo "done."

echo
echo

echo -----
echo STEP 6 - DEPLOYMENT COMPLETE
echo -----

echo
echo

sudo docker ps -a

echo
echo

echo LOADING 'KONG ADMIN'

echo
echo

wait $!

echo "done."
echo

echo
echo

echo "KONG ADMIN LOADED => http://localhost:1337"

echo
echo


wait; break;;
        No ) exit;;
    esac
done