#!/bin/sh
echo "********************************************************"
echo "Waiting for the Camunda server to start on port $CAMUNDA_PORT"
echo "********************************************************"
while ! `nc -z camunda  $CAMUNDA_PORT`; do sleep 3; done
echo "******* Camunda Server has started"


echo "********************************************************"
echo "Starting Camunda-console Service                           "
echo "********************************************************"
java -Djava.security.egd=file:/dev/./urandom -Dserver.port=$SERVER_PORT   \
     -Dspring.profiles.active=$PROFILE                                   \
     -jar /usr/local/app/@project.build.finalName@.jar