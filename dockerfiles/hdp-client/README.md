# hdp-client

## How to build

``` 
docker build -t hdp-client .
```

## How to run 

### Prerequisites

Cluster configs must be availlable on the host and $HADOOP_CONF_DIR environment variable defined.

If using Ambari, you can get it using WebApp or REST APIs:
```
export AMBARI_USER=admin
export AMBARI_PASS=<password>
export AMBARI_URL=http://<ambari-hostname>:8080

curl -o HDFS_CLIENT-configs.tar.gz       -u $AMBARI_USER:$AMBARI_PASS -X GET $AMBARI_URL/api/v1/clusters/experimentation/services/HDFS/components/HDFS_CLIENT?format=client_config_tar
curl -o YARN_CLIENT-configs.tar.gz       -u $AMBARI_USER:$AMBARI_PASS -X GET $AMBARI_URL/api/v1/clusters/experimentation/services/YARN/components/YARN_CLIENT?format=client_config_tar
curl -o MAPREDUCE2_CLIENT-configs.tar.gz -u $AMBARI_USER:$AMBARI_PASS -X GET $AMBARI_URL/api/v1/clusters/experimentation/services/MAPREDUCE2/components/MAPREDUCE2_CLIENT?format=client_config_tar

unset AMBARI_PASS
```

### Quickstart

The minimal and simplest way to to run, with hdfs as default entrypoint:
```
docker run --rm -it --read-only -v ${HADOOP_CONF_DIR:-/etc/hadoop/conf}:/etc/hadoop/conf hdp-client dfs -ls /
```

### Defining aliases

It's recommended to use aliases or functions to make it simpler:
```
alias hdp-client-bash='docker run --rm -it --read-only -v ${HADOOP_CONF_DIR:-/etc/hadoop/conf}:/etc/hadoop/conf -v $(pwd):/workdir --entrypoint=bash hdp-client'
alias hdp-client-hdfs='docker run --rm -it --read-only -v ${HADOOP_CONF_DIR:-/etc/hadoop/conf}:/etc/hadoop/conf -v $(pwd):/workdir --entrypoint=hdfs hdp-client'
alias hdp-client-yarn='docker run --rm -it --read-only -v ${HADOOP_CONF_DIR:-/etc/hadoop/conf}:/etc/hadoop/conf -v $(pwd):/workdir --entrypoint=yarn hdp-client'
```

### Running using aliases

Usage examples:
```
hdp-client-hdfs dfs -put source.txt /path/to/hdfs/
hdp-client-hdfs dfs -get /path/to/hdfs/source.txt dest.txt
```

### Totally contextualize the execution with current working directory
```
docker run -i -t --read-only -v ${HADOOP_CONF_DIR:-/etc/hadoop/conf}:/etc/hadoop/conf -v $(pwd):/workdir -v $(pwd):$(pwd) -w $(pwd) hdp-client dfs ls /
``` 

### If hostnames not in DNS

We cannot add hosts entries at build time, because they'll be overritten at runtime. 
But, at runtime we can pass entries to add to /etc/hosts file.

Example:
```
DOCKER_ADD_HOSTS='--add-host=node1.clustername.domain.tld:10.1.1.1 --add-host=node2.clustername.domain.tld:10.1.1.2 --add-host=node3.clustername.domain.tld:10.1.1.3'
export DOCKER_ADD_HOSTS 
```

Then use it into docker run with less typing:
```
docker run $DOCKER_ADD_HOSTS [...]
```

### Working with SELinux

If working with SELinux, volumes are not usable from the container.

It is possible to make it working by using z or Z flag when defining volumes.
```
docker run -v $(pwd):/workdir:Z  [...]
```

Behind the scenes, it makes some relabelling... But does it break something in the long run?
And relabelling isn't working on all filesystems or mountpoints like CIFS. The workaround is to mount using good SELinux Contexts.

Example:
```
//server/share /mnt/server/share  cifs rw,credentials=/etc/samba/credentials,context=system_u:object_r:container_file_t:s0 0 0
```

## Limitations

The container only see the current working directory on host, that means that we can't get/put files from anything else than current working directory subtree.

Accessing resources with good uid mappings between container and host?
Good examples with gosu and correct uid mappings in an entrypoint.sh script.
See:
- https://github.com/nlesc-sherlock/hdfs-dfs-client-docker
- https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
- https://github.com/tianon/gosu
