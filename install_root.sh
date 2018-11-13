#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/mattecentrum_buildout/etc/nginx.conf ./sites-available/mattecentrum.conf
cd sites-enabled
ln -s ../sites-available/mattecentrum.conf

service nginx stop
certbot certonly --standalone -d mattecentrum.voteit.se
service nginx start
