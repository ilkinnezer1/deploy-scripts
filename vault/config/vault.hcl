ui = true
disable_mlock = true

# API and cluster addresses
api_addr = "https://0.0.0.0:8200"
cluster_addr = "https://0.0.0.0:8201"

# TLS Listener configuration
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_cert_file = "/vault/certs/vault.crt"
  tls_key_file  = "/vault/certs/vault.key"
  tls_disable = false
  tls_min_version = "tls12"
  tls_disable_client_certs = true
}

# Raft integrated storage
storage "raft" {
  path = "/vault/data"
  node_id = "vault-node-1"
}

# Logging
log_level = "INFO"
log_format = "json"
