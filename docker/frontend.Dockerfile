FROM node:24-alpine AS build

WORKDIR /app

COPY academic-management-web/package*.json ./
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi

COPY academic-management-web/. .

ARG VITE_API_BASE_URL=/api
ARG VITE_APP_NAME="Academic Management"
ARG VITE_AUTH_MODE=sanctum
ENV VITE_API_BASE_URL=$VITE_API_BASE_URL
ENV VITE_APP_NAME=$VITE_APP_NAME
ENV VITE_AUTH_MODE=$VITE_AUTH_MODE

RUN npm run build

FROM nginx:1.27-alpine

COPY --from=build /app/dist /usr/share/nginx/html
COPY cloud-native-academic-management-system/docker/frontend-nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
