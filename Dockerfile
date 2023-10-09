# FROM registry.oikdev.local:5000/haproxy:2.2
# feature modify
FROM haproxy:latest
USER root
WORKDIR /usr/local/etc/haproxy/
COPY haproxy.cfg /usr/local/etc/haproxy/
COPY ckp1.pem /etc/ssl/
RUN chmod 755 /usr/local/etc/haproxy/haproxy.cfg
EXPOSE 443 9443
RUN apt update && apt install -y procps
CMD haproxy -f /usr/local/etc/haproxy/haproxy.cfg && sleep 365d