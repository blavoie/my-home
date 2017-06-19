# hdp-client

## How to build

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

## How to run 

### Quickstart

How to run, with hdfs as default entrypoint:
```
docker run --rm -it hdp-client dfs -ls /
```

### Aliases

Make aliases to make it possible to put/get files:
```
alias hdp-client-bash='docker run --rm -it -v $(pwd):/workdir --entrypoint=bash hdp-client'
alias hdp-client-hdfs='docker run --rm -it -v $(pwd):/workdir --entrypoint=hdfs hdp-client'
alias hdp-client-yarn='docker run --rm -it -v $(pwd):/workdir --entrypoint=yarn hdp-client'
```

If working with SELinux:
```
alias hdp-client-bash='docker run --rm -it -v $(pwd):/workdir:Z --entrypoint=bash hdp-client'
alias hdp-client-hdfs='docker run --rm -it -v $(pwd):/workdir:Z --entrypoint=hdfs hdp-client'
alias hdp-client-yarn='docker run --rm -it -v $(pwd):/workdir:Z --entrypoint=yarn hdp-client'
```

### Running with aliases

Usage examples:
```
hdp-client-hdfs dfs -put source.txt /path/to/hdfs/
hdp-client-hdfs dfs -get /path/to/hdfs/source /path/to/dest
```

## Limitations

The container only see the current working directory on host, that means that we can't get/put files from anything else than current working directory on host.

## TODO

Good examples with gosu and correct uid mappings in an entrypoint.sh script.

See:
- https://github.com/nlesc-sherlock/hdfs-dfs-client-docker
- https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
- https://github.com/tianon/gosu
