FROM scratch

ADD build/go-webber-linux-amd64 /go-webber

CMD ["/go-webber"]

EXPOSE 8080