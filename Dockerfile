FROM smalllark/java
MAINTAINER Dmitri Sh <smalllark@gmail.com>

# Install Upsource.
ENV UPSOURCE_HOME_DIR /var/lib/upsource
ENV UPSOURCE_VERSION 2.0.3554
RUN mkdir -p $UPSOURCE_HOME_DIR && \
    apt-get update && \
    apt-get install -y unzip && \
    cd $UPSOURCE_HOME_DIR && \
    wget -q http://download.jetbrains.com/upsource/upsource-$UPSOURCE_VERSION.zip && \
    unzip upsource-$UPSOURCE_VERSION.zip && \
    rm -rf upsource-$UPSOURCE_VERSION.zip && \
    rm -rf $UPSOURCE_HOME_DIR/Upsource/conf && \
    mkdir -p $UPSOURCE_HOME_DIR/Upsource/{data,backups,logs,conf}
ADD ./etc /etc

EXPOSE 8080
WORKDIR $UPSOURCE_HOME_DIR/Upsource

CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
