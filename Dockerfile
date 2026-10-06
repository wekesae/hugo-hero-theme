FROM klakegg/hugo:ext-alpine AS builder
WORKDIR /src
COPY . .
WORKDIR /src/exampleSite
RUN mkdir -p themes/hugo-hero-theme && \
    cp -r ../archetypes ../assets ../layouts ../static ../*.md ../hugo.toml themes/hugo-hero-theme/ 2>/dev/null || true
RUN hugo --minify

FROM nginx:alpine
COPY --from=builder /src/exampleSite/public /usr/share/nginx/html
