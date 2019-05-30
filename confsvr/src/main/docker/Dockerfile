FROM adoptopenjdk/openjdk11-openj9:alpine-slim
RUN echo http://mirrors.ustc.edu.cn/alpine/v3.8/main > /etc/apk/repositories; \
    echo http://mirrors.ustc.edu.cn/alpine/v3.8/community >> /etc/apk/repositories \
    &&  apk update && apk upgrade && apk add netcat-openbsd \
    && apk add --no-cache tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* $HOME/.cache \
    && mkdir -p /usr/local/configserver
#RUN cd /tmp/ && \
#    curl -k -LO "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -b 'oraclelicense=accept-securebackup-cookie' && \
#    unzip jce_policy-8.zip && \
#    rm jce_policy-8.zip && \
#    yes |cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/
ADD @project.build.finalName@.jar /usr/local/configserver/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh