FROM alpine:3.3
MAINTAINER x.h.
RUN apk --update upgrade && apk add gcc make build-base musl-dev
RUN mkdir -p /iozone
ADD http://www.iozone.org/src/current/iozone3_470.tar /iozone
RUN cd iozone && tar -xf iozone3_470.tar

RUN cd iozone/iozone*/src/current &&\
      make linux &&\
      ./iozone -Rab output.wks &&\
      cp output.wks ../../../../
      

