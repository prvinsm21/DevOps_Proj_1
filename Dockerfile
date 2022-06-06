FROM centos:latest
MAINTAINER prvinsm20@gmail.com
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum install -y httpd \
    zip \
    unzip
#COPY  coffee_shop.zip /var/www/html/
ADD  https://www.free-css.com/assets/files/free-css-templates/download/page276/adward.zip /var/www/html/
WORKDIR /var/www/html/

RUN unzip adward.zip
RUN cp -rf adward/* .
RUN rm -rf adward/ adward.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
