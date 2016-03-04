FROM revett/collectd
MAINTAINER Zi Shen Lim <zlim.lnx@gmail.com>

ADD collectd.kairosdb.conf.tpl /etc/collectd/configs/collectd.kairosdb.conf.tpl
ADD kairosdb_writer.py /usr/lib64/collectd/kairosdb_writer.py
ADD collectd_iostat_python.py /usr/lib64/collectd/collectd_iostat_python.py
ADD iostat_types.db /etc/collectd/types/iostat_types.db

RUN chmod +x /usr/lib64/collectd/kairosdb_writer.py
RUN chmod +x /usr/lib64/collectd/collectd_iostat_python.py

RUN apt-get install -y sysstat
