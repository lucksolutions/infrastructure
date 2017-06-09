
path "secret/jenkins" {
  policy = "read"
  capabilities = ["read", "list"]
}

path "jenkins-host-ssh" {
  policy = "write"
}
