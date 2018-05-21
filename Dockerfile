FROM swaggerapi/swagger-codegen-cli:latest
RUN apk update && apk add bash
COPY codegen /usr/local/bin/codegen
ENTRYPOINT []
