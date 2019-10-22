FROM python:3.7-slim

RUN pip install snmpsim

RUN adduser --system snmpsim && rm -rf /usr/local/snmpsim/data/* && rm -rf /usr/local/snmpsim/variation/ 

ADD data /usr/local/snmpsim/data

RUN chmod 755 /tmp

EXPOSE 1024/udp

CMD snmpsimd.py --agent-udpv4-endpoint=0.0.0.0:1024 --process-user=snmpsim --process-group=nogroup --v2c-arch
