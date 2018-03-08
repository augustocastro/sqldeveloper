FROM java:8-jdk

RUN apt-get update && \

    apt-get install -y xdg-utils x11-xkb-utils file && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ADD sqldeveloper/ /sqldeveloper

RUN ln -s /usr/bin/java /bin/java

RUN chmod u+x /sqldeveloper/**.sh

RUN mkdir -p /root/.sqldeveloper/17.4.0/

RUN echo "SetJavaHome /usr/lib/jvm/java-8-openjdk-amd64/" >> /root/.sqldeveloper/17.4.0/product.conf

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

CMD /bin/bash -c "/sqldeveloper/sqldeveloper.sh"
