FROM hugomods/hugo:exts AS builder
WORKDIR /src
COPY . .
WORKDIR /src/exampleSite
RUN hugo --minify

FROM nginx:alpine
# Ensure this copies from exampleSite/public where Hugo actually generated the files
COPY --from=builder /src/exampleSite/public /usr/share/nginx/html
