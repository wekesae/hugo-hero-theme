FROM hugomods/hugo:exts AS builder
WORKDIR /src
COPY . .
WORKDIR /src/exampleSite
RUN mkdir -p themes/hugo-hero-theme && \
    cp -r ../archetypes ../assets ../layouts ../static ../*.md ../hugo.toml themes/hugo-hero-theme/ 2>/dev/null || true
RUN hugo --minify

FROM nginx:alpine
# Ensure this points precisely to the generated public folder
COPY --from=builder /src/exampleSite/public /usr/share/nginx/html
