FROM fedora:latest

RUN useradd -ms /bin/bash nobody
RUN useradd -ms /bin/bash  collin

RUN mkdir -p /home/root/data ; chown -R root:root /home/root/data
USER root

RUN mkdir -p /home/nobody/data ; chown -R nobody:nobody /home/root/data
USER nobody

RUN dnf -y update && dnf -y install httpd

COPY my-info.html /var/www/html/index.html.html

EXPOSE 80

ENTRYPOINT [ "/usr/sbin/httpd" ] 

CMD [ "-D", "FOREGROUND" ]
