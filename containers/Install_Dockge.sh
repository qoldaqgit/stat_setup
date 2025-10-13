mkdir dockge
cd dockge

echo "services:
  dockge:
    image: louislam/dockge:1
    restart: unless-stopped
    ports:
      # Host Port : Container Port
      - 5001:5001
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/app/data
      - /root/dockge/stacks:/root/dockge/stacks
    environment:
      # Tell Dockge where is your stacks directory
      - DOCKGE_STACKS_DIR=/root/dockge/stacks
      # (Optional) Allow console managment
      - DOCKGE_ENABLE_CONSOLE=true" >| compose.yml
docker-compose up -d
