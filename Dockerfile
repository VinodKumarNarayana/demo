FROM maven:latest as build
WORKDIR /C/MyProjects/cmad/demo
COPY . /C/MyProjects/cmad/demo
RUN mvn package

FROM tomcat
WORKDIR /opt/tomcat
COPY --from=build /C/MyProjects/cmad/demo/target/*.war webapps
CMD catalina.sh run

