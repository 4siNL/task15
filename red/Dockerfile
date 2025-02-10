FROM nginx:mainline-alpine3.20@sha256:814a8e88df978ade80e584cc5b333144b9372a8e3c98872d07137dbf3b44d0e4

ENV PORT=$PORT

RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid /var/cache/nginx /etc/nginx/conf.d

COPY red.conf.template /etc/nginx/conf.d/

COPY red.html /usr/share/nginx/html/

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

USER nginx

EXPOSE $PORT

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
