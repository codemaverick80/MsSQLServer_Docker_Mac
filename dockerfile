FROM mcr.microsoft.com/mssql/server:2017-latest AS build
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=strongPwd@1

WORKDIR /tmp
COPY AdventureWorksLT2017.bak .
COPY restore-backup.sql .

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
  && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "strongPwd@1" -i /tmp/restore-backup.sql \
  && pkill sqlservr

FROM mcr.microsoft.com/mssql/server:2017-latest AS release

ENV ACCEPT_EULA=Y

COPY --from=build /var/opt/mssql/data /var/opt/mssql/data