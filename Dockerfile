# CI-Test1
#Download base image ubuntu 16.04
FROM ubuntu

# Update Software repository
RUN apt-get update -y
RUN apt-get install apache2  curl vim -y
RUN sed -i '6 i\'"ServerName localhost"'' /etc/apache2/ports.conf
RUN sed -i '6 i\'"Listen 8081"'' /etc/apache2/ports.conf
RUN /etc/init.d/apache2 start
RUN cp /var/www/html/index.html /var/www/html/index.html-old
RUN echo "Hi, This is Arulraj Anto, test page 1" > /var/www/html/index.html

# Binds to port 8081
EXPOSE  8081

# Start the service
#CMD /usr/sbin/apache2ctl -D FOREGROUND
CMD /usr/sbin/apache2ctl -D FOREGROUND
