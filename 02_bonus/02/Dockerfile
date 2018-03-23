# TO RUN
# docker run -p 49160:8080 -d <nameofbuild>
# tutorial https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
# test : curl -i 192.168.99.100:49160

FROM 	node:carbon

WORKDIR	/usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD [ "npm", "start" ]
