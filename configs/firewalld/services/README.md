To install:

```bash
# cp cassandra-client.xml /etc/firewalld/services/
# restorecon /etc/firewalld/services/cassandra-client.xml
# chmod 640 /etc/firewalld/services/cassandra-client.xml
# firewall-cmd --permanent --zone=myzone --add-service=cassandra-client 

```
