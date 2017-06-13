#! /bin/bash


#If Vault option is configured...
if [[ -z $VAULT_ADDR && -z $VAULT_TOKEN ]]; then
    vault auth $VAULT_TOKEN

    #Pull the client CA from Vault and add it to the SSHD config
    vault read -field=public_key jenkins-client-ssh/config/ca > /etc/ssh/jenkins-client-ca-keys.pem
    echo 'TrustedUserCAKeys /etc/ssh/jenkins-client-ca-keys.pem' >> /etc/ssh/sshd_config

    #Sign our generated SSH key with our vault host CA
    cat /etc/ssh/ssh_host_rsa_key.pub | vault write -field=signed_key jenkins-host-ssh/sign/hostrole public_key=- cert_type=host > /etc/ssh/ssh_host_rsa_key-cert.pub
    chmod 0640 /etc/ssh/ssh_host_rsa_key-cert.pub

    #Pull Jenkins Master ssh client key from vault and add to authorized keys
    
fi

#Start the SSH Daemon
/usr/sbin/sshd -D
exit $?