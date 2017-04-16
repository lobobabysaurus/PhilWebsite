FROM node:4.3.2

RUN npm install -g hexo-cli

WORKDIR /blog

EXPOSE 4000

COPY . .
