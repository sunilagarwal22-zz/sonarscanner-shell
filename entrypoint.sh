#!/bin/bash

set -e

echo -e "Called"

sonar-scanner \
    -Dsonar.host.url=${INPUT_HOST} \
    -Dsonar.login=${INPUT_LOGIN} \
    -Dsonar.projectKey=${INPUT_PROJECTNAME} \
    -Dsonar.projectName=${INPUT_PROJECTNAME} \
    -Dsonar.sources=. \
    -Dsonar.exclusions="utils/**,violet/Docker/Swarm/60-Maintenance/**,violet/Docker/Swarm/Scripts/AWS-Swarm/**,violet/Docker/Swarm/Scripts/azure/**,violet/Jenkins/AWS/**"
