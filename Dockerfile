FROM golang
WORKDIR /go/src/github.com/KOKThaweesak/go-container-debugging
EXPOSE 8080 2345
RUN go get github.com/KOKThaweesak/delve/cmd/dlv
ADD . /go/src/github.com/KOKThaweesak/go-container-debugging

#CMD ["dlv", "debug", "github.com/KOKThaweesak/go-container-debugging", "--headless", "--listen=0.0.0.0:2345", "--api-version=2", "--log"]
CMD ["dlv", "test", "github.com/KOKThaweesak/go-container-debugging", "--headless", "--listen=0.0.0.0:2345", "--api-version=2", "--log"]

#ENTRYPOINT ["vmstat","1"]