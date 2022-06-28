FROM node:latest

RUN apt-get update && apt-get install -y git
RUN mkdir -p /home/node/ckobb/node_modules && chown -R node:node /home/node/ckobb
WORKDIR /home/node/ckobb

RUN git clone https://github.com/sigiltenebrae/ckobb_angular.git
WORKDIR /home/node/ckobb/ckobb_angular
RUN npm install
RUN npm install -g @angular/cli

#RUN npm run build --prod

EXPOSE 4200/tcp

#RUN node_modules/.bin/ng serve --host=0.0.0.0 --disable-host-check
CMD ng serve --host 0.0.0.0 --disable-host-check
