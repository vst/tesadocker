# Docker Container for tesa Deployment

This repository hosts the Dockerfile (and future related files) for tesa deployment using docker.

## Running this image

    docker run -p 8069:8069 --name tesa -d -t vehbisinan/tesadocker -- --db_host=hostname --db_user=username --db_password="password"

## Apache Proxy

If you need a proxy from the host system:

    <VirtualHost *:80>
      ServerName yourdomainname.com
      ProxyPass / http://localhost:8069/
      ProxyPassReverse / http://localhost:8069/
    </VirtualHost>

Note that ports need to match to the specified one in the run command.