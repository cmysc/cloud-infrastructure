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
      
 
 
#----------------------------------------------------------------------
# the above is the first easy method to save the output file together with docker container, so that it can be checked by "docker run -it containnerID"
#----------------------------------------------------------------------
# VOLUME /barcelona  # it has been created by "docker volume create barcelona", if not it looks also fine Then using 'docker run containerID -v barcelona:/barcelona "cd iozone/iozone*/src/current/ ./iozone -Rab  > /barcelona/output.wks"  '
#-------------
# docker run -it containerID  -v hostPDW/data:/barcelona ' ' ...
