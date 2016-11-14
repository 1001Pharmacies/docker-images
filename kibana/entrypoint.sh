#!/bin/sh

sed -i "s/^elasticsearch_url: .*/elasticsearch_url: \"http:\/\/$ELASTICSEARCH_URL\"/" /opt/kibana/config/kibana.yml

exec "$@"