FROM golang  
WORKDIR /work
ADD . .
RUN go test ./...
RUN cat /etc/hosts # used to verify extrahosts
ARG foo
ARG bar
ENV foo=${foo}
ENV bar=${bar}
RUN go build -o /bin/myapp .
WORKDIR /
RUN rm -r /work
CMD ["/bin/myapp"]  