# https://github.com/learnwlonline/managing-secrets
pod=vault-65c8f84779-blk45
token=myroot
alias k=kubectl
vault_url=http://localhost:30466
# k exec $pod -n vault -- vault --help
# k logs $pod -n vault 

# k exec $pod -n vault -- export VAULT_ADDR='http://0.0.0.0:1234'
# k exec $pod -n vault -- env
# k exec $pod -n vault -- vault status --address=http://127.0.0.1:8200
# k exec $pod -n vault -- VAULT_ADDR='http://127.0.0.1:8200'
# k exec $pod -n vault -- vault  path-help -address=http://127.0.0.1:8200 secret 
# k exec $pod -n vault -- vault  path-help -address=http://127.0.0.1:8200 sys
k exec $pod -n vault -- vault  read -address=http://127.0.0.1:8200 -format json sys/auth
# k exec $pod -n vault -- vault write -address=http://127.0.0.1:8200 --help
# k exec $pod -n vault -- vault auth -address=http://127.0.0.1:8200 $token
# k exec $pod -n vault -- vault login -address=http://127.0.0.1:8200 $token
# k exec $pod -n vault -- vault write -address=http://127.0.0.1:8200 secret/cookie  receipe=sugar  --> v1
k exec $pod -n vault -- vault kv put -address=http://127.0.0.1:8200 secret/cookie  receipe=sugar03 
# k exec $pod -n vault -- vault kv get -address=http://127.0.0.1:8200 secret/cookie
# k exec $pod -n vault -- vault kv get -address=http://127.0.0.1:8200 -format json secret/cookie
# k exec $pod -n vault -- vault kv delete -address=http://127.0.0.1:8200 secret/cookie

# curl -X POST -H "X-Vault-Token: myroot" \
#   -d '{"somekey": "somesecret"}' \
#   $vault_url"/v2/secret/dev"

# curl -H "X-Vault-Token: myroot" \
#   -X GET \
#   http://127.0.0.1:30466/v2/secret/cookie


curl \
    -H "X-Vault-Token: myroot" \
    -H "X-Vault-Request: true" \
    -X LIST \
    http://127.0.0.1:30466/v2/secret/

vault operator   init