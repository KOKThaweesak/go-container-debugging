FROM golang
WORKDIR /go/src/github.com/KOKThaweesak/go-container-debugging
EXPOSE 8080 2345
RUN go get github.com/derekparker/delve/cmd/dlv
ADD . /go/src/github.com/KOKThaweesak/go-container-debugging

ARG PACKAGE
ARG PACK="github.com/KOKThaweesak/go-container-debugging/${PACKAGE}"
ENV TESTPACKAGE $PACK

ARG MODE
ENV RUNMODE $MODE



#CMD ["dlv", "debug", "github.com/KOKThaweesak/go-container-debugging", "--headless", "--listen=0.0.0.0:2345", "--api-version=2", "--log"]
#CMD ["dlv", "test", "github.com/KOKThaweesak/go-container-debugging", "--headless", "--listen=0.0.0.0:2345", "--api-version=2", "--log"]
#CMD ["dlv", "test","${TESTPACKAGE}", "--headless", "--listen=0.0.0.0:2345", "--api-version=2", "--log"]
CMD dlv ${RUNMODE} ${TESTPACKAGE} --headless --listen=0.0.0.0:2345 --api-version=2 --log


#ENTRYPOINT ["vmstat","1"]