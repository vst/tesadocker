# Docker Container for tesa Deployment

This repository hosts the Dockerfile (and future related files) for tesa deployment using docker.

## Running this image

    docker run -p 8069:8069 --name tesa -d -t vehbisinan/tesadocker -- --db_host=hostname --db_user=username --db_password="password"
