FROM nginx:alpine

ARG FLAG=CTF{placeholder_flag}
ENV FLAG=${FLAG}

WORKDIR /app

# Write flag at build time (when BUILD_TIME flag injection is enabled)
RUN echo "$FLAG" > /app/flag.txt && \
    cp /app/flag.txt /flag.txt && \
    chmod 644 /app/flag.txt /flag.txt

COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 1337 80

ENTRYPOINT ["/entrypoint.sh"]
