@echo off

REM Copyright (C) 2012 eXo Platform SAS.
REM 
REM This is free software; you can redistribute it and/or modify it
REM under the terms of the GNU Lesser General Public License as
REM published by the Free Software Foundation; either version 2.1 of
REM the License, or (at your option) any later version.
REM 
REM This software is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
REM Lesser General Public License for more details.
REM 
REM You should have received a copy of the GNU Lesser General Public
REM License along with this software; if not, write to the Free
REM Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
REM 02110-1301 USA, or see the FSF site: http://www.fsf.org.

REM ########################################
REM Settings customisation
REM ########################################
REM You have 2 ways to customize your installation settings :
REM 1- uncomment/add and change value to override settings in the above section
REM 2- use environment properties of the system to override the value
REM ########################################
REM SET EXO_JVM_VENDOR=IBM
REM SET EXO_JVM_SIZE_MAX=2g
REM SET EXO_JVM_SIZE_MIN=1g
REM SET EXO_PROFILES=all
REM SET EXO_HTTP_COMPRESSION=on

REM =============================================================================#
REM            /!\     DON'T MODIFY BESIDE THIS LINE      /!\                    #
REM =============================================================================#

REM ########################################
REM Default EXO PLATFORM configuration
REM ########################################
IF NOT DEFINED EXO_PROFILES SET EXO_PROFILES=default
IF NOT DEFINED EXO_CONF_DIR_NAME SET EXO_CONF_DIR_NAME=gatein\conf
IF NOT DEFINED EXO_CONF_DIR SET EXO_CONF_DIR=%CATALINA_HOME%\%EXO_CONF_DIR_NAME%

REM ########################################
REM Default Logs configuration
REM ########################################
REM Default configuration for logs (using logback framework - http://logback.qos.ch/manual/configuration.html )
IF NOT DEFINED EXO_LOGS_LOGBACK_CONFIG_FILE SET EXO_LOGS_LOGBACK_CONFIG_FILE=%CATALINA_HOME%/conf/logback.xml

REM ########################################
REM Default JVM configuration
REM ########################################
IF NOT DEFINED EXO_JVM_VENDOR SET EXO_JVM_VENDOR=ORACLE
IF NOT DEFINED EXO_JVM_SIZE_MAX SET EXO_JVM_SIZE_MAX=1g
IF NOT DEFINED EXO_JVM_SIZE_MIN SET EXO_JVM_SIZE_MIN=512m
IF NOT DEFINED EXO_JVM_PERMSIZE_MAX SET EXO_JVM_PERMSIZE_MAX=256m
IF NOT DEFINED EXO_JVM_PERMSIZE_MIN SET EXO_JVM_PERMSIZE_MIN=128m

REM ########################################
REM Default Tomcat configuration
REM ########################################
REM Global Tomcat settings
IF NOT DEFINED EXO_TOMCAT_SHUTDOWN_PORT SET EXO_TOMCAT_SHUTDOWN_PORT=8005
IF NOT DEFINED EXO_TOMCAT_SHUTDOWN_KEY SET EXO_TOMCAT_SHUTDOWN_KEY=SHUTDOWN
IF NOT DEFINED EXO_TOMCAT_REDIRECT_PORT SET EXO_TOMCAT_REDIRECT_PORT=8443
IF NOT DEFINED EXO_TOMCAT_URI_ENCODING SET EXO_TOMCAT_URI_ENCODING=UTF-8
IF NOT DEFINED EXO_TOMCAT_RMI_REGISTRY_PORT SET EXO_TOMCAT_RMI_REGISTRY_PORT=10001
IF NOT DEFINED EXO_TOMCAT_RMI_SERVER_PORT SET EXO_TOMCAT_RMI_SERVER_PORT=10002
IF NOT DEFINED EXO_TOMCAT_RMI_LOCAL_PORT SET EXO_TOMCAT_RMI_LOCAL_PORT=false
IF NOT DEFINED EXO_TOMCAT_JVMROUTE_NAME SET EXO_TOMCAT_JVMROUTE_NAME=""

REM HTTP configuration
IF NOT DEFINED EXO_HTTP_PORT SET EXO_HTTP_PORT=8080
IF NOT DEFINED EXO_HTTP_ADDRESS SET EXO_HTTP_ADDRESS=0.0.0.0
IF NOT DEFINED EXO_HTTP_PROTOCOL SET EXO_HTTP_PROTOCOL=org.apache.coyote.http11.Http11NioProtocol
IF NOT DEFINED EXO_HTTP_CX_TIMEOUT SET EXO_HTTP_CX_TIMEOUT=20000
IF NOT DEFINED EXO_HTTP_COMPRESSION SET EXO_HTTP_COMPRESSION=off
IF NOT DEFINED EXO_HTTP_COMPRESSION_MIN_SIZE SET EXO_HTTP_COMPRESSION_MIN_SIZE=2048

REM AJP configuration
IF NOT DEFINED EXO_AJP_PORT SET EXO_AJP_PORT=8009
IF NOT DEFINED EXO_AJP_ADDRESS SET EXO_AJP_ADDRESS=0.0.0.0
IF NOT DEFINED EXO_AJP_PROTOCOL SET EXO_AJP_PROTOCOL=AJP/1.3
IF NOT DEFINED EXO_AJP_CX_TIMEOUT SET EXO_AJP_CX_TIMEOUT=20000

REM ########################################
REM Default Datasources configuration
REM ########################################
REM Datasource IDM
IF NOT DEFINED EXO_DS_IDM_DRIVER SET EXO_DS_IDM_DRIVER=org.hsqldb.jdbcDriver
IF NOT DEFINED EXO_DS_IDM_USERNAME SET EXO_DS_IDM_USERNAME=sa
IF NOT DEFINED EXO_DS_IDM_PASSWORD SET EXO_DS_IDM_PASSWORD=""
IF NOT DEFINED EXO_DS_IDM_MAX_ACTIVE SET EXO_DS_IDM_MAX_ACTIVE=20
IF NOT DEFINED EXO_DS_IDM_MAX_IDLE SET EXO_DS_IDM_MAX_IDLE=10
IF NOT DEFINED EXO_DS_IDM_MAX_WAIT SET EXO_DS_IDM_MAX_WAIT=10000
IF NOT DEFINED EXO_DS_IDM_URL SET EXO_DS_IDM_URL="jdbc:hsqldb:file:%CATALINA_HOME%\gatein\data\hsql\exo-idm_portal"

REM Datasource PORTAL
IF NOT DEFINED EXO_DS_PORTAL_DRIVER SET EXO_DS_PORTAL_DRIVER=org.hsqldb.jdbcDriver
IF NOT DEFINED EXO_DS_PORTAL_USERNAME SET EXO_DS_PORTAL_USERNAME=sa
IF NOT DEFINED EXO_DS_PORTAL_PASSWORD SET EXO_DS_PORTAL_PASSWORD=""
IF NOT DEFINED EXO_DS_PORTAL_MAX_ACTIVE SET EXO_DS_PORTAL_MAX_ACTIVE=20
IF NOT DEFINED EXO_DS_PORTAL_MAX_IDLE SET EXO_DS_PORTAL_MAX_IDLE=10
IF NOT DEFINED EXO_DS_PORTAL_MAX_WAIT SET EXO_DS_PORTAL_MAX_WAIT=10000
IF NOT DEFINED EXO_DS_PORTAL_URL SET EXO_DS_PORTAL_URL="jdbc:hsqldb:file:%CATALINA_HOME%\gatein\data\hsql\exo-jcr_portal"

REM ########################################
REM Export the needed system properties for server.xml
REM ########################################
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_SHUTDOWN_PORT=%EXO_TOMCAT_SHUTDOWN_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_SHUTDOWN_KEY=%EXO_TOMCAT_SHUTDOWN_KEY%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_REDIRECT_PORT=%EXO_TOMCAT_REDIRECT_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_URI_ENCODING=%EXO_TOMCAT_URI_ENCODING%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_RMI_REGISTRY_PORT=%EXO_TOMCAT_RMI_REGISTRY_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_RMI_SERVER_PORT=%EXO_TOMCAT_RMI_SERVER_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_RMI_LOCAL_PORT=%EXO_TOMCAT_RMI_LOCAL_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_TOMCAT_JVMROUTE_NAME=%EXO_TOMCAT_JVMROUTE_NAME%

SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_HTTP_PORT=%EXO_HTTP_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_HTTP_ADDRESS=%EXO_HTTP_ADDRESS%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_HTTP_PROTOCOL=%EXO_HTTP_PROTOCOL%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_HTTP_CX_TIMEOUT=%EXO_HTTP_CX_TIMEOUT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_HTTP_COMPRESSION=%EXO_HTTP_COMPRESSION%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_HTTP_COMPRESSION_MIN_SIZE=%EXO_HTTP_COMPRESSION_MIN_SIZE%

SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_AJP_PORT=%EXO_AJP_PORT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_AJP_ADDRESS=%EXO_AJP_ADDRESS%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_AJP_PROTOCOL=%EXO_AJP_PROTOCOL%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_AJP_CX_TIMEOUT=%EXO_AJP_CX_TIMEOUT%

SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_DRIVER=%EXO_DS_IDM_DRIVER%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_USERNAME=%EXO_DS_IDM_USERNAME%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_PASSWORD=%EXO_DS_IDM_PASSWORD%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_MAX_ACTIVE=%EXO_DS_IDM_MAX_ACTIVE%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_MAX_IDLE=%EXO_DS_IDM_MAX_IDLE%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_MAX_WAIT=%EXO_DS_IDM_MAX_WAIT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_IDM_URL=%EXO_DS_IDM_URL%

SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_DRIVER=%EXO_DS_PORTAL_DRIVER%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_USERNAME=%EXO_DS_PORTAL_USERNAME%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_PASSWORD=%EXO_DS_PORTAL_PASSWORD%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_MAX_ACTIVE=%EXO_DS_PORTAL_MAX_ACTIVE%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_MAX_IDLE=%EXO_DS_PORTAL_MAX_IDLE%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_MAX_WAIT=%EXO_DS_PORTAL_MAX_WAIT%
SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -DEXO_DS_PORTAL_URL=%EXO_DS_PORTAL_URL%

REM SET EXO_SERVER_XML_OPTS=%EXO_SERVER_XML_OPTS% -D=%%

REM ########################################
REM Logs customization (Managed by slf4J\logback instead of tomcat-juli & co)
REM ########################################
REM Deactivate j.u.l
SET LOGGING_MANAGER=-Dnop
REM Add additional bootstrap entries for logging purpose using SLF4J+Logback
REM SLF4J deps
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\slf4j-api-${org.slf4j.version}.jar
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\jul-to-slf4j-${org.slf4j.version}.jar
REM LogBack deps
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\logback-core-${ch.qas.logback.version}.jar
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\logback-classic-${ch.qas.logback.version}.jar
REM Janino deps (used by logback for conditional processing in the config file)
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\janino-${org.codehaus.janino.version}.jar
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\commons-compiler-${org.codehaus.janino.version}.jar
REM Jansi deps for colorized output on windows
SET CLASSPATH=%CLASSPATH%;%CATALINA_HOME%\lib\jansi-${org.fusesource.jansi.version}.jar

REM ########################################
REM Compute the CATALINA_OPTS
REM ########################################
SET CATALINA_OPTS=%CATALINA_OPTS% -Xms%EXO_JVM_SIZE_MIN% -Xmx%EXO_JVM_SIZE_MAX% -XX:MaxPermSize=%EXO_JVM_PERMSIZE_MAX%
SET CATALINA_OPTS=%CATALINA_OPTS% -Dexo.profiles=%EXO_PROFILES%
SET CATALINA_OPTS=%CATALINA_OPTS% -Djava.security.auth.login.config="%CATALINA_HOME%\conf\jaas.conf"
SET CATALINA_OPTS=%CATALINA_OPTS% -Dexo.conf.dir.name="%EXO_CONF_DIR_NAME%" -Dexo.conf.dir="%EXO_CONF_DIR%"
SET CATALINA_OPTS=%CATALINA_OPTS% -Djavasrc="%JAVA_HOME%\src.zip" -Djre.lib="%JAVA_HOME%\jre\lib"
REM Logback configuration file
SET CATALINA_OPTS=%CATALINA_OPTS% -Dlogback.configurationFile="%EXO_LOGS_LOGBACK_CONFIG_FILE%"
REM Define the XML Parser depending on the JVM vendor
if %EXO_JVM_VENDOR%==IBM (
  SET CATALINA_OPTS=%CATALINA_OPTS% -Djavax.xml.stream.XMLOutputFactory=com.sun.xml.stream.ZephyrWriterFactory -Djavax.xml.stream.XMLInputFactory=com.sun.xml.stream.ZephyrParserFactory -Djavax.xml.stream.XMLEventFactory=com.sun.xml.stream.events.ZephyrEventFactory
) else (
  SET CATALINA_OPTS=%CATALINA_OPTS% -Djavax.xml.stream.XMLOutputFactory=com.sun.xml.internal.stream.XMLOutputFactoryImpl -Djavax.xml.stream.XMLInputFactory=com.sun.xml.internal.stream.XMLInputFactoryImpl -Djavax.xml.stream.XMLEventFactory=com.sun.xml.internal.stream.events.XMLEventsFactoryImpl
)
SET CATALINA_OPTS=%CATALINA_OPTS% -Djava.net.preferIPv4Stack=true
REM Disable EHCache update checker
SET CATALINA_OPTS=%CATALINA_OPTS% -Dnet.sf.ehcache.skipUpdateCheck=true
SET CATALINA_OPTS=%CATALINA_OPTS% %EXO_SERVER_XML_OPTS%