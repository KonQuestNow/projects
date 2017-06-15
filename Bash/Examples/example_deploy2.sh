!/bin/bash

clear

echo "------------"
echo "Stopping Containers"
echo "------------"

sudo docker stop $(sudo docker ps -a -q)

wait $!

echo "------------"
echo "Removing Containers"
echo "------------"

sudo docker rm $(sudo docker ps -a -q)

wait $!

echo "------------"
echo "Removing Images"
echo "------------"

sudo docker rmi $(sudo docker images -q)

wait $!

echo "------------"
echo "Running DB"
echo "------------"

sudo docker run -d --name kong-database \
               -p 9042:9042 \
               -v ~/local/volumes/kong:/var/lib/cassandra \
               cassandra:3


wait $!

echo "------------"
echo "Running KONG"
echo "------------"

sudo docker run -d -it --name kong \
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
               

wait $!

echo "------------"
echo "Running KONGA Admin"
echo "------------"
sudo docker run -d -it --name konga \
               -p 5000:5000 \
               -p 1337:1337 \
               -e "KONGA_BACKEND_URL=http://127.0.0.1:1337" \
               --link kong:kong \
 				pantsel/konga

wait $!

echo "------------"
echo "Complete => http://127.0.0.1:1337"
echo "------------"