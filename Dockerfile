FROM alpine:latest

RUN apk add --no-cache openssh bash && \
    ssh-keygen -A && \
    adduser -D -s /bin/bash ctf && \
    echo "ctf:ctf" | chpasswd && \
    adduser -D -s /bin/bash admin && \
    echo "admin:admin" | chpasswd && \
    sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin no/' /etc/ssh/sshd_config

ARG FLAG=CTF{placeholder_flag}
ENV FLAG=${FLAG}

RUN echo "$FLAG" > /home/ctf/flag.txt && \
    echo "$FLAG" > /home/admin/flag.txt && \
    chown ctf:ctf /home/ctf/flag.txt && \
    chown admin:admin /home/admin/flag.txt && \
    chmod 444 /home/ctf/flag.txt /home/admin/flag.txt

COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]