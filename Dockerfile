FROM java:8

RUN echo "Asia/Shanghai" > /etc/timezone

COPY *.jar /opt/bin/
COPY run.sh /opt/bin/

ENV PATH $PATH:/opt/bin

RUN chmod -R 777 /opt/bin/

EXPOSE 8080 8000

CMD ["run.sh"]