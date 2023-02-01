FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y sysbench

COPY h1_script.sh /

ENTRYPOINT ["/h1_script.sh"]

EXPOSE 3000

CMD /h1_script.sh

