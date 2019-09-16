FROM php:7.2-cli-stretch

RUN apt-get update && apt-get install -y libssl-dev git bash rsync openssh-client;

RUN curl -O https://dl.pimlab.de/aphpbreakdown/aphpbreakdown.phar \
    && chmod +x aphpbreakdown.phar \
    && mv aphpbreakdown.phar /usr/bin/aphpbreakdown;

RUN printf "# aphpbreakdown php cli ini settings\n\
memory_limit=-1\n\
" > $PHP_INI_DIR/php-cli.ini

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/bin/bash", "/docker-entrypoint.sh"]

CMD ["aphpbreakdown"]