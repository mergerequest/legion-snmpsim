FROM python:3.7-slim

RUN pip install snmpsim

RUN adduser --system snmpsim && rm -rf /usr/local/snmpsim/data/*

ADD data /usr/local/snmpsim/data

EXPOSE 161/udp

CMD snmpsimd.py --agent-udpv4-endpoint=0.0.0.0:161 --process-user=snmpsim --process-group=nogroup
