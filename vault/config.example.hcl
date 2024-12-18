ui = true

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_cert_file = "/vault/certs/vault.crt"
  tls_key_file  = "/vault/certs/vault.key"
}

storage "file" {
  path = "/vault/data"
}

api_addr = "https://127.0.0.1:8200"

disable_mlock = true
