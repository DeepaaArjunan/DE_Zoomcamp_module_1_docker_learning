# DE_Zoomcamp_module_1_docker_learning

docker run hello-world

docker run -it ubuntu #interactive

docker run -it ubuntu bash

docker run -it python:3.9

docker run -it python:3.9 bash

docker run -it \
-e POSTGRES_USER="root" \
-e POSTGRES_PASSWORD="root" \
-e POSTGRES_DB="ny_taxi" \
-v /workspaces/DE_Zoomcamp_module_1_docker_learning/ny_taxi_postgres_data:/var/lib/postgresql/data \
-p 5432:5432 \
postgres:13

pip install pgcli

pgcli -h localhost -p 5432 -u root -d ny_taxi

pip install jupyter

jupyter notebook

docker run -it \
-e PGADMIN_DEFAULT_EMAIL="deepa.arjunan@outlook.com" \
-e PGADMIN_DEFAULT_PASSWORD="root" \
-p 8080:80 \
dpage/pgadmin4

docker network create pg_network

docker run -it \
-e POSTGRES_USER="root" \
-e POSTGRES_PASSWORD="root" \
-e POSTGRES_DB="ny_taxi" \
-v /workspaces/DE_Zoomcamp_module_1_docker_learning/ny_taxi_postgres_data:/var/lib/postgresql/data \
-p 5432:5432 \
--network=pg_network \
--name pg_database \
postgres:13

docker run -it \
-e PGADMIN_DEFAULT_EMAIL="deepa.arjunan@outlook.com" \
-e PGADMIN_DEFAULT_PASSWORD="root" \
-p 8080:80 \
--network=pg_network \
--name pgadmin \
dpage/pgadmin4

python ingest_data.py \
--user=root \
--password=root \
--host=localhost \
--port=5432 \
--db=ny_taxi \
--table_name=yellow_taxi_data \
--url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2019-01.csv.gz"

docker build -t taxi_ingest:v001 .

docker run  \
--network=pg-network \
taxi_ingest:v001 \
--user=root \
--password=root \
--host=de_zoomcamp_module_1_docker_learning-pgdatabase-1 \
--port=5432 \
--db=ny_taxi \
--table_name=yellow_taxi_data \
--url="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2019-01.csv.gz" 


docker-compose up

docker-compose down

docker-compose up -d

