#!/bin/bash

#ENV=$1
#DEBUG_MODE_ENABLE=$2
#JAR_PATH=$3
#LOG=$4

if [ -z $JAVA_OPTS ];then
    JAVA_OPTS="-Xms512m -Xmx1024m"
fi

if [ -z $ENV ];then
    ENV="dev"
fi

if [ -z $JAR_PATH ];then
    JAR_PATH="/opt/bin"
fi

if [ x$DEBUG_MODE_ENABLE = "xtrue" ];then
    DEBUG="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n"
fi

if [ x$LOG != "xfalse" ];then
    mkdir -p logs
    LOGGING_OPT="--logging.path=./logs"
fi

echo java $JAVA_OPTS -Dspring.profiles.active=$ENV $LOGGING_OPT -Dserver.port=8080 $DEBUG  -jar ${JAR_PATH}/*.jar

java $JAVA_OPTS -Dspring.profiles.active=$ENV -Dlogging.path=./logs -Dserver.port=8080 $DEBUG  -jar ${JAR_PATH}/*.jar