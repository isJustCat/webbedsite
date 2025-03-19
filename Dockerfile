FROM alpine:latest AS build

RUN apk add --update hugo

WORKDIR /opt/webbedsite

COPY . .

RUN ls -la

RUN ["hugo", "-b", "https://critter.codes"]

FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html

RUN rm /usr/share/nginx/html/index.html

COPY --from=build /opt/webbedsite/public .

EXPOSE 80/tcp