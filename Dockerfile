FROM alpine:3.24

RUN apk --update \
    add lighttpd && \
    rm -rf /var/cache/apk/*

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 80
VOLUME /var/www

CMD ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

