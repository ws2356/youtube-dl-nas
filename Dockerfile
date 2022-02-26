# youtube-dl-nas Server Dockerfile
# https://github.com/hyeonsangjeon/youtube-dl-nas.git

# FROM python:3-onbuild
FROM python:3.8
LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

ENV http_proxy 'http://192.168.0.88:8118'
ENV https_proxy 'http://192.168.0.88:8118'

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ffmpeg \
  #libav-tools \
  dos2unix \
  && rm -rf /var/lib/apt/lists/*


COPY /subber /usr/bin/subber 
COPY /run.sh /
RUN chmod +x /usr/bin/subber && \
     dos2unix /usr/bin/subber && \
     ln -s /usr/src/app/downfolder / && \
     chmod +x /run.sh && \
     dos2unix /run.sh


RUN python3 -m pip install -U youtube-dl

ENV http_proxy ''
ENV https_proxy ''

EXPOSE 8080

VOLUME ["/downfolder"]

CMD [ "/bin/bash", "/run.sh" ]
#CMD [ "python", "-u", "./youtube-dl-server.py" ]
