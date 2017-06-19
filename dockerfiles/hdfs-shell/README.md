# hdfs-shell

## How to build

```
docker build -t hdfs-shell .
```

## How to run

```
docker run $DOCKER_ADD_HOSTS --rm -it -v /etc/hadoop/conf:/etc/hadoop/conf hdfs-shell
```


