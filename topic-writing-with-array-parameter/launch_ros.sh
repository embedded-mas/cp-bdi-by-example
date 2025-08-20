# Encerrar e limpar containers se estiverem rodando
for cname in noetic; do
    if docker ps -q --filter "name=${cname}" | grep -q .; then
        echo "Stopping existing container: ${cname}"
        docker stop "${cname}"
    fi
done

sudo docker network create ros

docker run -p9090:9090 --rm --net=ros --name noetic maiquelb/embedded-mas-ros:latest