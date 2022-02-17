FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=US/Eastern

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install sudo curl git nodejs npm jq apache2 wget apt-utils p7zip-full nano -y

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

RUN git clone --recurse-submodules https://github.com/begleysm/quakejs.git
RUN git clone https://github.com/treyyoder/quakejs-docker

WORKDIR /quakejs
RUN npm install
RUN ls
COPY server.cfg /quakejs/base/baseq3/server.cfg
COPY server.cfg /quakejs/base/cpma/server.cfg

#ADD ./data/QU4KEZER0.zip.001 /quakejs/base/baseq3/
#ADD ./data/QU4KEZER0.zip.002 /quakejs/base/baseq3/
#ADD ./data/QU4KEZER0.zip.003 /quakejs/base/baseq3/
#WORKDIR /quakejs/base/baseq3/
#RUN 7z x QU4KEZER0.zip.001
#RUN rm -rf QU4KEZER0.zip.*
#WORKDIR /quakejs

# The two following lines are not necessary because we copy assets from include.  Leaving them here for continuity.
# WORKDIR /var/www/html
# RUN bash /var/www/html/get_assets.sh

RUN cp -rf /quakejs-docker/include/ioq3ded/ioq3ded.fixed.js /quakejs/build/ioq3ded.js
RUN rm /var/www/html/index.html && cp -rf /quakejs/html/* /var/www/html/
RUN cp -rf /quakejs-docker/include/assets/ /var/www/html/assets
RUN ls /var/www/html

RUN echo "127.0.0.1 content.quakejs.com" >> /etc/hosts

WORKDIR /
ADD entrypoint.sh /entrypoint.sh
# Was having issues with Linux and Windows compatibility with chmod -x, but this seems to work in both
RUN chmod 777 ./entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]