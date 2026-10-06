FROM klakegg/hugo:alpine AS builder
WORKDIR /src
COPY . .

# Run Hugo directly pointing to the exampleSite directory
RUN hugo --source=/src/exampleSite --minify

FROM nginx:alpine
COPY --from=builder /src/exampleSite/public /usr/share/nginx/html
