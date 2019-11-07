FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
RUN npm update
COPY . .
RUN npm run build
#CMD ["npm", "start"]

FROM nginx as runner
COPY --from=builder /app/dist/spa-demo /usr/share/nginx/html
