FROM node:8

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin 

#USER node
WORKDIR /home/node
RUN npm install solr-security-proxy

COPY * solr-json-to-csv/
RUN npm install solr-json-to-csv
RUN npm install forever -g
COPY application_config.json /home/node/

USER node
CMD forever application_config.json
