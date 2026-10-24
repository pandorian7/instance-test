FROM nginx:alpine
ARG FLAG=not-set-at-build
# Build-time flag injection: baked into the image
RUN echo "$FLAG" > /usr/share/nginx/html/build-flag.txt
COPY index.html /usr/share/nginx/html/index.html
COPY start.sh /docker-entrypoint.d/40-runtime-flag.sh
RUN chmod +x /docker-entrypoint.d/40-runtime-flag.sh
EXPOSE 80