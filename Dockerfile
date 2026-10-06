FROM klakegg/hugo:alpine AS builder
WORKDIR /src
COPY . .
WORKDIR /src/exampleSite
RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /src/exampleSite/public /usr/share/nginx/html
