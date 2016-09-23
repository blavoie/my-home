FROM kibana:4
MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN gosu kibana /opt/kibana/bin/kibana plugin --install elastic/sense

RUN echo 'kibana.enabled: false' >> /opt/kibana/config/kibana.yml && \    
    echo 'elasticsearch.enabled: false' >> /opt/kibana/config/kibana.yml  

EXPOSE 5601
