FROM revett/collectd
MAINTAINER Zi Shen Lim <zlim.lnx@gmail.com>

ADD collectd.kairosdb.conf.tpl /etc/collectd/configs/collectd.kairosdb.conf.tpl
ADD kairosdb_writer.py /usr/lib64/collectd/kairosdb_writer.py

RUN chmod +x /usr/lib64/collectd/kairosdb_writer.py
