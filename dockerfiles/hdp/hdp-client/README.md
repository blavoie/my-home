How to fetch all configs:
```
export AMBARI_USER=admin
export AMBARI_PASS=<password>
export AMBARI_URL=http://<ambari-hostname>:8080

curl -o conf/HDFS_CLIENT-configs.tar.gz       -u $AMBARI_USER:$AMBARI_PASS -X GET $AMBARI_URL/api/v1/clusters/experimentation/services/HDFS/components/HDFS_CLIENT?format=client_config_tar
curl -o conf/YARN_CLIENT-configs.tar.gz       -u $AMBARI_USER:$AMBARI_PASS -X GET $AMBARI_URL/api/v1/clusters/experimentation/services/YARN/components/YARN_CLIENT?format=client_config_tar
curl -o conf/MAPREDUCE2_CLIENT-configs.tar.gz -u $AMBARI_USER:$AMBARI_PASS -X GET $AMBARI_URL/api/v1/clusters/experimentation/services/MAPREDUCE2/components/MAPREDUCE2_CLIENT?format=client_config_tar

```

How to build:
``` 
docker build -t hdp-client .
    
```

How to run, with hdfs as default entrypoint:
```
docker run --rm -it hdp-client dfs -ls /
```
