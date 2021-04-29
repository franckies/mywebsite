#STAGE 1: GENERATE HTML
FROM ubuntu:latest as HUGOINSTALL


RUN apt-get update
RUN apt-get --yes install hugo

COPY . /hugo-site

RUN hugo -v --source=/hugo-site --destination=/hugo-site/public

#STAGE 2: START WEBSERVER
FROM nginx:stable-alpine

RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html

COPY --from=HUGOINSTALL /hugo-site/public/ /usr/share/nginx/html/

EXPOSE 80

