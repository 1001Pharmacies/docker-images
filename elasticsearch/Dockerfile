# Pull base image.
FROM elasticsearch:2.4.1

# Install HEAD / KOPF plugin
RUN \
  cd /usr/share/elasticsearch && \
  bin/plugin install mobz/elasticsearch-head && \
  bin/plugin install lmenezes/elasticsearch-kopf