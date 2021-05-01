FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build will have the build that is needed
# as per nginx docs for static hosting the build forlder needs to pasted in 
# /usr/share/nginx/html

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html