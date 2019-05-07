containerID=$(sudo docker container ls | grep "client" | head | awk '{print $1}')
sudo docker attach $containerID