FROM node:8

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin 

WORKDIR /home/node
RUN npm install solr-security-proxy

COPY * solr-json-to-csv/
RUN npm install solr-json-to-csv
RUN npm install forever -g
COPY application_config.json /home/node/

# setup logging dirs
RUN mkdir -p /home/node/logs/solr-security-proxy
RUN mkdir -p /home/node/logs/solr-json-to-csv
RUN chown -R node /home/node/logs
VOLUME /home/node/logs

USER node
EXPOSE 8000
EXPOSE 9090

CMD forever application_config.json
