# hdfs-shell

Makes a containter with https://github.com/avast/hdfs-shell inside.

## How to build

```
docker build -t hdfs-shell .
```

## How to run

Be careful, because hdfs-shell don't support $HADOOP_CONF_DIR environment variable but stick with /etc/hadoop/conf directory. We must deploy files into this directory or simply go with a volume

Static volume:
```
docker run $DOCKER_ADD_HOSTS --rm -it -v /etc/hadoop/conf:/etc/hadoop/conf hdfs-shell
```

Dynamic volume:
```
docker run $DOCKER_ADD_HOSTS --rm -it -v $HADOOP_CONF_DIR:/etc/hadoop/conf hdfs-shell
```

### Aliases

```
alias hdfs-shell='docker run $DOCKER_ADD_HOSTS --rm -it -v $HADOOP_CONF_DIR:/etc/hadoop/conf hdfs-shell'
```

