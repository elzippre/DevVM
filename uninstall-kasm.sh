sudo docker rm -f $(sudo docker container ls -qa --filter="label=kasm.kasmid")
export KASM_UID=$(id kasm -u)
export KASM_GID=$(id kasm -g)
sudo -E docker compose -f /opt/kasm/current/docker/docker-compose.yaml rm
sudo docker network rm kasm_default_network
plugin_name=$(sudo docker network inspect kasm_sidecar_network --format '{{.Driver}}')
sudo docker network rm kasm_sidecar_network
sudo docker plugin disable $plugin_name
sudo docker plugin rm $plugin_name
sudo rm -rf /var/log/kasm-sidecar
sudo rm -rf /var/run/kasm-sidecar
sudo docker volume rm kasm_db_1.16.1
sudo docker rmi redis:5-alpine
sudo docker rmi postgres:14-alpine
sudo docker rmi kasmweb/nginx:latest
sudo docker rmi kasmweb/share:1.16.1
sudo docker rmi kasmweb/agent:1.16.1
sudo docker rmi kasmweb/manager:1.16.1
sudo docker rmi kasmweb/api:1.16.1
sudo docker rmi $(sudo docker images --filter "label=com.kasmweb.image=true" -q)
sudo rm -rf /opt/kasm/
sudo deluser kasm_db
sudo deluser kasm