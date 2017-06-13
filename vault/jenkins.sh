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
vault write jenkins-client-ssh/roles/clientrole ttl=30m0s allow_user_certificates=true key_type=ca allowed_users=*

vault mount -path jenkins-host-ssh ssh
vault write -f jenkins-host-ssh/config/ca
vault mount-tune -max-lease-ttl=87600h jenkins-host-ssh
vault write jenkins-host-ssh/roles/hostrole ttl=87600h allow_host_certificates=true key_type=ca

