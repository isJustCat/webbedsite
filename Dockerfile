FROM alpine:latest AS build

RUN apk add --update hugo

WORKDIR /opt/webbedsite

COPY . .

RUN ["hugo", "-b", "https://critter.codes"]

FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html

COPY --from=build /opt/webbedsite/public .

EXPOSE 80/tcp