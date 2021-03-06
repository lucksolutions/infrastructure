#https://github.com/jenkinsci/docker
FROM jenkins:alpine

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --webroot=/var/cache/jenkins/war"

RUN /usr/local/bin/install-plugins.sh \
    bouncycastle-api:2.16.1 \
    cloudbees-folder:6.0.4 \
    structs:1.7 \
    junit:1.20 \
    antisamy-markup-formatter:1.5 \
    pam-auth:1.3 \
    windows-slaves:1.3.1 \
    display-url-api:2.0 \
    mailer:1.20 \
    ldap:1.15 \
    token-macro:2.1 \
    external-monitor-job:1.7 \
    icon-shim:2.0.3 \
    matrix-auth:1.6 \
    script-security:1.28 \
    matrix-project:1.11 \
    build-timeout:1.18 \
    credentials:2.1.13 \
    workflow-step-api:2.11 \
    plain-credentials:1.4 \
    credentials-binding:1.11 \
    timestamper:1.8.8 \
    scm-api:2.1.1 \
    workflow-api:2.17 \
    workflow-support:2.14 \
    durable-task:1.13 \
    workflow-durable-task-step:2.11 \
    resource-disposer:0.6 \
    ws-cleanup:0.33 \
    ant:1.5 \
    gradle:1.26 \
    pipeline-milestone-step:1.3.1 \
    jquery-detached:1.2.1 \
    ace-editor:1.1 \
    workflow-scm-step:2.4 \
    workflow-cps:2.34 \
    pipeline-input-step:2.7 \
    pipeline-stage-step:2.2 \
    workflow-job:2.11 \
    pipeline-graph-analysis:1.4 \
    pipeline-rest-api:2.8 \
    handlebars:1.1.1 \
    momentjs:1.1.1 \
    pipeline-stage-view:2.8 \
    pipeline-build-step:2.5 \
    pipeline-model-api:1.1.4 \
    pipeline-model-extensions:1.1.4 \
    ssh-credentials:1.13 \
    git-client:2.4.6 \
    git-server:1.7 \
    workflow-cps-global-lib:2.8 \
    branch-api:2.0.9 \
    workflow-multibranch:2.15 \
    authentication-tokens:1.3 \
    docker-commons:1.6 \
    docker-workflow:1.11 \
    pipeline-stage-tags-metadata:1.1.4 \
    pipeline-model-declarative-agent:1.1.1 \
    workflow-basic-steps:2.5 \
    pipeline-model-definition:1.1.4 \
    workflow-aggregator:2.5 \
    jackson2-api:2.7.3 \
    github-api:1.85.1 \
    git:3.3.0 \
    github:1.27.0 \
    github-branch-source:2.0.6 \
    pipeline-github-lib:1.0 \
    github-organization-folder:1.6 \
    mapdb-api:1.0.9.0 \
    subversion:2.7.2 \
    ssh-slaves:1.17 \
    email-ext:2.57.2 \
    blueocean:1.0.1 \
    hashicorp-vault-plugin:2.1.0