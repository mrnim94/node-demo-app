FROM node:alpine
WORKDIR /app
ADD . /app
RUN npm install
EXPOSE 80
CMD npm start
