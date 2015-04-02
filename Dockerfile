## Extend "odoo" image:
FROM odoo

## Blah blah:
MAINTAINER Vehbi Sinan Tunalioglu <vst@vsthost.com>

## Change the user to root for a while:
USER root

## Install wget:
RUN apt-get update && apt-get install -y wget unzip vim

## Create an addons folder:
RUN mkdir /opt/addons

## Download required files:
RUN wget -O /tmp/repo_tesa.zip https://github.com/vst/tesa/archive/0.0.21.zip

## Unzip stuff:
RUN find /tmp/ -iname "repo_*.zip" -exec unzip -d /tmp/repos {} \;

## Move stuff:
RUN rm -Rf /opt/addons/*
RUN cp -Rf /tmp/repos/tesa-0.0.21/* /opt/addons/

## Delete stuff:
RUN find /tmp/ -iname "repo_*.zip" -delete
RUN rm -Rf /tmp/repos/

## Change configuration:
RUN sed -i.bak "s/extra-addons/extra-addons,\/opt\/addons/g" /etc/odoo/openerp-server.conf

## Change the user back to odoo:
USER odoo
