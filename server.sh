containerID=$(sudo docker container ls | grep "server" | head | awk '{print $1}')
sudo docker attach $containerID