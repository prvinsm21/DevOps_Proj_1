FROM centos:latest
MAINTAINER prvinsm20@gmail.com
RUN yum install -y httpd \
    zip \
    unzip 
COPY  coffee_shop.zip /var/www/html/
WORKDIR /var/www/html/

RUN unzip coffee_shop.zip
RUN cp -rf coffee_shop/* .
RUN rm -rf coffee_shop/ coffee_shop.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
