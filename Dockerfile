# Stage 1: Build the Hugo static site
FROM klakegg/hugo:alpine AS builder
WORKDIR /src
COPY . .
RUN hugo --minify

# Stage 2: Serve the compiled site using Nginx
FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
