FROM php:7.1-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        git \
        zip \
        unzip \
        curl \
        openssh-server \
        cron \
        supervisor \
    && docker-php-ext-install bcmath mbstring mcrypt
RUN apt-get update && apt-get install -y python-dev python-pip
RUN apt-get install -y libxml2-dev
RUN docker-php-ext-install pdo pdo_mysql soap gd
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN a2enmod rewrite

RUN pip install awsebcli --upgrade --user

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
