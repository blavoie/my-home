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

Other way to map volumes and uid correctly:
```
alias hdp-client-bash='docker run --rm -it -u `id -u $USER` -v $(pwd):/workdir --entrypoint=bash hdp-client'
alias hdp-client-hdfs='docker run --rm -it -u `id -u $USER` -v $(pwd):/workdir --entrypoint=hdfs hdp-client'
alias hdp-client-yarn='docker run --rm -it -u `id -u $USER` -v $(pwd):/workdir --entrypoint=yarn hdp-client'
```

This not work as expected now, as we'll need gosu in an entrypoint.sh script.

See:
- https://github.com/nlesc-sherlock/hdfs-dfs-client-docker
- https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
- https://github.com/tianon/gosu
