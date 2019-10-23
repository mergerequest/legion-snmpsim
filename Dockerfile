FROM python:3.7-slim

RUN pip install snmpsim

RUN adduser --system snmpsim && rm -rf /usr/local/snmpsim/data/* && rm -rf /usr/local/snmpsim/variation/ 

ADD data /usr/local/snmpsim/data

RUN mkdir -p /tmp/snmpsim
RUN touch /tmp/snmpsim/_usr_local_snmpsim_data_public.dbm
RUN chmod -R 777 /tmp

EXPOSE 1024/udp

CMD snmpsimd.py --agent-udpv4-endpoint=0.0.0.0:1024 --process-user=snmpsim --process-group=nogroup --v2c-arch
