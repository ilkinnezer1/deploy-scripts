# container name will be "vault" for api and other connections !
# https://vault:8200 || https://vault:8201 || https://vault:8125

ui = true
disable_mlock = true

# API and cluster addresses
api_addr      = "https://vault:8200"
cluster_addr  = "https://vault:8201"

# Raft integrated storage
storage "raft" {
  path = "/vault/data"
  node_id = "vault-node-1"
}

# TLS Listener configuration
listener "tcp" {
  address       = "vault:8200"
  tls_cert_file = "/vault/certs/vault.crt"
  tls_key_file  = "/vault/certs/vault.key"
  tls_disable = false
  tls_min_version = "tls12"
  tls_disable_client_certs = true
}

telemetry {
  statsite_address = "vault:8125"
  disable_hostname = true
}

# Logging
log_level = "INFO"
log_format = "json"
