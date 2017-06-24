#! /bin/bash


#If Vault option is configured...
if [[ -n $VAULT_TOKEN ]]; then
    echo "Reading secrets from Vault..."
    vault auth $VAULT_TOKEN

    #Pull the client CA from Vault and add it to the SSHD config
    vault read -field=public_key jenkins-client-ssh/config/ca > /etc/ssh/jenkins-client-ca-keys.pem

    #Sign our generated SSH key with our vault host CA
    cat /etc/ssh/ssh_host_rsa_key.pub | vault write -field=signed_key jenkins-host-ssh/sign/hostrole public_key=- cert_type=host > /etc/ssh/ssh_host_rsa_key-cert.pub
    chmod 0644 /etc/ssh/ssh_host_rsa_key-cert.pub

    #Pull Jenkins Master ssh client key from vault and add to authorized keys
    #vault read -field=ssh_public_key secret/jenkins > /home/jenkins/.ssh/authorized_keys
    #chown jenkins /home/jenkins/.ssh/authorized_keys
    #chmod 600 /home/jenkins/.ssh/authorized_keys
fi

#Start the SSH Daemon
echo "Starting SSH Daemon"
/usr/sbin/sshd -D
exit $?