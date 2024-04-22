FROM ubuntu/apache2:latest

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update &&\
	apt-get install -y --no-install-recommends vim &&\
	apt-get install -y --no-install-recommends nano &&\
    apt-get install -y --no-install-recommends ant &&\
	apt-get install -y --no-install-recommends git-all

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - &&\
    apt-get update && \
    apt-get install -y nodejs && \
	apt-get install -y npm

RUN rm -rf /var/lib/apt/lists/* &&\
    apt clean

RUN mkdir -p /home/projects

RUN ln -sf /usr/share/zoneinfo/Asia/Singapore /etc/localtime

WORKDIR /home/projects

# Expose Port for the Application 
EXPOSE 80 443 8000 3000 3083
CMD [ "node", "app.js" ]
