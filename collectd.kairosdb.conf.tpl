Hostname "{{ HOST_NAME | default("collectd-docker") }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin statsd
LoadPlugin cpu

<Plugin statsd>
  Host "::"
  Port "8125"
  DeleteSets      true
  TimerPercentile 90.0
</Plugin>

<LoadPlugin "python">
  Globals true
</LoadPlugin>

<Plugin "python">
  ModulePath "/usr/lib64/collectd/"

  Import "kairosdb_writer"

  <Module "kairosdb_writer">
    KairosDBURI "telnet://{{ EP_HOST }}:{{ EP_PORT }}"
    KairosDBProtocol "tcp"
    LowercaseMetricNames true
    TypesDB "/usr/share/collectd/types.db" #"/etc/collectd/types/custom.db"
    ConvertToRate "cpu", "interface"
  </Module>
</Plugin>
