# kibana-sense

This image is used to make sense usable from a client desktop to easily interrogate Elasticsearch clusters when Sense should not be made available to end-users.

## How to build

```
docker build -t blavoie/kibana-sense .
```

## How to run

```
docker run -d -p 5601:5601 --name kibana-sense blavoie/kibana-sense 
```

Put this URL to your browser:

```
http://localhost:5601/app/sense
```
