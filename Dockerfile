FROM swaggerapi/swagger-codegen-cli:latest
RUN apk update && apk add bash zip
COPY htmlDocUtf8.patch /root/htmlDocUtf8.patch
WORKDIR /root
RUN unzip /opt/swagger-codegen-cli/swagger-codegen-cli.jar htmlDocs/index.mustache && \
	patch -p0  htmlDocs/index.mustache htmlDocUtf8.patch && \
	zip /opt/swagger-codegen-cli/swagger-codegen-cli.jar -u htmlDocs/index.mustache && \
	rm -rf htmlDocs
COPY codegen /usr/local/bin/codegen
ENTRYPOINT []
