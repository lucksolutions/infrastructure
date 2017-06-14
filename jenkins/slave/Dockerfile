#https://engineering.riotgames.com/news/jenkins-ephemeral-docker-tutorial
FROM centos:7

ENV VAULT_ADDR http://vault:8200

# Install Essentials
RUN yum update -y && \
         yum clean all

# Install Packages
RUN yum install -y git && \
         yum install -y wget && \
         yum install -y openssh-server && \
         yum install -y java-1.8.0-openjdk && \
         yum install -y sudo && \
         yum install -y unzip && \
         yum clean all

# Install Vault Client
RUN wget https://releases.hashicorp.com/vault/0.7.3/vault_0.7.3_linux_amd64.zip
RUN unzip -d /usr/local/bin vault_0.7.3_linux_amd64.zip
RUN rm -f vault_0.7.3_linux_amd64.zip

# gen dummy keys, centos doesn't autogen them like ubuntu does
RUN /usr/bin/ssh-keygen -A

# Set SSH Configuration to allow remote logins without /proc write access
RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

# Create Jenkins User
RUN useradd jenkins -m -s /bin/bash

# Add public key for Jenkins login
RUN mkdir /home/jenkins/.ssh
RUN chown -R jenkins /home/jenkins
RUN chgrp -R jenkins /home/jenkins
RUN chmod 700 /home/jenkins/.ssh

# Add the jenkins user to sudoers
RUN echo "jenkins  ALL=(ALL)  ALL" >> etc/sudoers

# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod 740 /entrypoint.sh

# Expose SSH port and run entrypoint script. This will start SSH Daemon
EXPOSE 22
CMD ["/entrypoint.sh"]