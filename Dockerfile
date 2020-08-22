FROM node:latest as redux-simples
WORKDIR /app
COPY package.json /app
RUN npm install --silent
COPY . . 
CMD npm run build

FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=redux-simples app/dist /usr/share/nginx/html
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf