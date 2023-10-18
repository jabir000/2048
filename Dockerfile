FROM ubuntu:22.04
RUN sudo apt ubdate -y
RUN sudo apt install -y git curl nginx zip
RUN echo "daemon off;">>/etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://github.com/Yash-Repalle/2048_Game/archive/refs/heads/master.zip
RUN cd /var/www/html/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip
EXPOSE 80
CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]