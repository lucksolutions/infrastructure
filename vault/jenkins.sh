#!/bin/bash

#Create Policy for Jenkins
vault policy-write jenkins ./policy/jenkins-policy.hcl

#Setup App Role for Jenkins
vault auth-enable approle
vault write auth/approle/role/jenkins secret_id_ttl=10m token_num_uses=10 token_ttl=20m token_max_ttl=30m secret_id_num_uses=40 policies=jenkins
vault write -f auth/approle/role/jenkins/secret-id

#Create SSH keys for jenkins slaves
vault mount -path jenkins-client-ssh ssh
vault write -f jenkins-client-ssh/config/ca
vault write jenkins-client-ssh/roles/clientrole @jenkins-client-role.json

#Create Jenkins SSH key
KEYPASS=$(openssl rand -base64 64)
ssh-keygen -t rsa -b 4096 -q -N "$KEYPASS" -f /tmp/jenkins-ssh

#Sign key with vault
cat /tmp/jenkins-ssh.pub | vault write -field=signed_key jenkins-client-ssh/sign/clientrole public_key=- cert_type=user > /tmp/jenkins-ssh-cert.pub

#Write Keys to vault
vault write secret/jenkins \
    ssh_private_key_pass="$KEYPASS" \
    ssh_private_key=@/tmp/jenkins-ssh \
    ssh_public_key=@/tmp/jenkins-ssh.pub \
    ssh_public_key_cert=@/tmp/jenkins-ssh-cert.pub
#rm -rf /tmp/jenkins-ssh /tmp/jenkins-ssh.pub


vault mount -path jenkins-host-ssh ssh
vault write -f jenkins-host-ssh/config/ca
vault mount-tune -max-lease-ttl=87600h jenkins-host-ssh
vault write jenkins-host-ssh/roles/hostrole ttl=87600h allow_host_certificates=true key_type=ca

echo "Jenkins private key pass: $KEYPASS"


