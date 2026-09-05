#!/bin/sh
set -eu

port="${PORT:-8080}"
sed -i -E "s/port=\"8080\" protocol=\"HTTP\/1.1\"/port=\"${port}\" protocol=\"HTTP\/1.1\"/" "$CATALINA_HOME/conf/server.xml"
exec "$CATALINA_HOME/bin/catalina.sh" run
