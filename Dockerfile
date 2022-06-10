#builder-nek fogja hivni az egész blokkot
FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#---- idáig -> ez csak temporary, felhasználjuk ami a build után történik

FROM nginx as runner
COPY --from=builder /app/build /usr/share/nginx/html
