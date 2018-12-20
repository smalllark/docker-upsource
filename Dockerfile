FROM jetbrains/upsource:2018.2.1141

USER root

RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get install -y curl && \
    apt-get install -y wget && \
# install python
    apt-get install -y python-pip && \
    apt-get install -y python3 && apt-get install -y python3-pip && \

# install php
    apt-get install -y libapache2-mod-php php gnupg && \
# install yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \
# install nodejs
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

USER jetbrains
