FROM golang:1.15-alpine As build

# Set necessary environmet variables needed for our image
ENV GIN_MODE=release
# Move to working directory
WORKDIR /src/

# Copy and download dependency using go mod
COPY main.go go.* /src/
RUN GCO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]

