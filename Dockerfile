FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# This base image has a run command of 'start nginx' so it is not needed in this case.