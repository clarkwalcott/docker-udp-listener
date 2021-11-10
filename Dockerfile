FROM alpine:3.14

RUN apk add --update \
    python3 \
    python3-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

ENV PYTHONUNBUFFERED=1
ENV UDPPORT 5005
ADD udplistener.py /udplistener.py
CMD ["python3", "-u","/udplistener.py"]

EXPOSE ${UDPPORT}
EXPOSE ${UDPPORT}/udp
