FROM sonarsource/sonar-scanner-cli:4.3

USER root

RUN apt-get update && \
    apt-get install -y wget xz-utils

RUN mkdir /usr/share/sonar-tools
WORKDIR /usr/share/sonar-tools

RUN wget https://github.com/koalaman/shellcheck/releases/download/v0.7.0/shellcheck-v0.7.0.linux.x86_64.tar.xz && \
    tar xf shellcheck-v0.7.0.linux.x86_64.tar.xz && \
    rm -rf shellcheck-v0.7.0.linux.x86_64.tar.xz

ARG SONAR_SCANNER_HOME=/opt/sonar-scanner
ARG SHELLCHECK_HOME=/usr/share/sonar-tools/shellcheck-v0.7.0/

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}:${SHELLCHECK_HOME}

COPY entrypoint.sh /usr/share/
RUN chmod +x /usr/share/entrypoint.sh

ENTRYPOINT ["/usr/share/entrypoint.sh"]
