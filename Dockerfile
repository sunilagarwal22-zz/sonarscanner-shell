FROM openjdk:11-jre-slim

RUN apt update
RUN apt-get install -y wget zip xz-utils

RUN mkdir /usr/share/sonar-tools

WORKDIR /usr/share/sonar-tools

RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102-linux.zip && \
    unzip sonar-scanner-cli-4.3.0.2102-linux.zip && \
    rm -rf sonar-scanner-cli-4.3.0.2102-linux.zip

RUN wget https://github.com/koalaman/shellcheck/releases/download/v0.7.0/shellcheck-v0.7.0.linux.x86_64.tar.xz && \
    tar xf shellcheck-v0.7.0.linux.x86_64.tar.xz && \
    rm -rf shellcheck-v0.7.0.linux.x86_64.tar.xz

ARG SONAR_SCANNER_HOME=/usr/share/sonar-tools/sonar-scanner-4.3.0.2102-linux/bin/
ARG SHELLCHECK_HOME=/usr/share/sonar-tools/shellcheck-v0.7.0/

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}:${SHELLCHECK_HOME}

COPY entrypoint.sh /usr/share/
RUN chmod +x /usr/share/entrypoint.sh

ENTRYPOINT ["/usr/share/entrypoint.sh"]