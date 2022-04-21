FROM tomcat:7.0-jre8

ENV CATALINA_HOME /usr/local/tomcat

ENV OPENIG_BASE /var/openig

ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR $CATALINA_HOME

ENV CATALINA_OPTS="-Xmx2048m -server"

RUN apt-get install -y wget unzip

RUN wget --quiet https://oss.sonatype.org/service/local/repositories/snapshots/content/org/openidentityplatform/openig/openig-war/5.0.12-SNAPSHOT/openig-war-5.0.12-20220414.151342-14.war

RUN rm -fr $CATALINA_HOME/webapps/*

RUN mv *.war $CATALINA_HOME/webapps/ROOT.war

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]