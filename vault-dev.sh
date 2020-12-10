token=s.PxnXC2nwMgBbtkiE9mhGmLB9
alias vault=~/bin/vault
export VAULT_ADDR='http://127.0.0.1:8200'

# vault status
# curl -X POST -H "X-Vault-Token: s.PxnXC2nwMgBbtkiE9mhGmLB9" \
#   -d '{"somekey": "somesecret"}' \
#   $VAULT_ADDR"/v2/secret/dev"

# curl -X PUT -H "X-Vault-Token:s.PxnXC2nwMgBbtkiE9mhGmLB9" \
#   -d '{"somekey": "somesecret"}' \
#   http://localhost:8200/v2/secret/dev

# curl \
#     -H "X-Vault-Token: s.PxnXC2nwMgBbtkiE9mhGmLB9" \
#     -X GET \
#     http://127.0.0.1:8200/v2/secret/dev?version=2

curl \
    --header "X-Vault-Token: s.PxnXC2nwMgBbtkiE9mhGmLB9" \
    https://127.0.0.1:8200/v2/secret/data/my-secret?version=0

# vault login $token
# vault auth enable userpass
# vault auth list
# vault write auth/userpass/users/bgood password=badpassword
# vault login -method=userpass username=bgood
# vault auth
# vault token revoke login/bgood
# vault list auth/userpass/users
# vault auth enable github
# vault write auth/github/config organization=footprns
# vault write auth/github/map/teams/default value=default
# vault login -method=github token=sdfsdfsd

# docker run -p 389:389 --env LDAP_TLS=false --name ldap-service - d osixia/openldap:1.1.8
# docker run -p 6443:443 --name phpldapadmin0service --hostname phpldapadmin-server --env PHPLDAPADMIN_LDAP_HOSTS=ldap-hot -d osixia/phpldapadmin:0.7.0

# Wrapping token
# vault read -wrap-ttl="1h" secret/dev/foo


# Key                    Value
# ---                    -----
# token                  s.QUyNgkNijnHaCEM7N2pytRSK
# token_accessor         03Pt2sZnsWzrr7SzecJK5FfD
# token_duration         768h
# token_renewable        true
# token_policies         ["default"]
# identity_policies      []
# policies               ["default"]
# token_meta_username    bgood

# vault token lookup
# vault token create -policy="dev_policy"
# Key                  Value
# ---                  -----
# token                s.xKT1u6TQ9z58wj4MT7pnRpSQ
# token_accessor       aUf5cJeIbVnXQUZOb9QdJlC4
# token_duration       768h
# token_renewable      true
# token_policies       ["default" "dev_policy"]
# identity_policies    []
# policies             ["default" "dev_policy"]

# vault token renew 1h
# vault wrap 
vault operator init -address=http://127.0.0.1:8200 
vault unseal -address=http://127.0.0.1:8200 


vault  write -address=http://127.0.0.1:8200 auth/ldap/config \
    url="ldap://ldap" \
    binddn="cn=admin,dc=my-company,dc=com" \
    userattr="uid" \
    bindpass='JonSn0w' \
    userdn="ou=Users,dc=my-company,dc=com" \
    groupdn="ou=Groups,dc=my-company,dc=com" \
    insecure_tls=true 

vault auth enable -path=ldap  -address=http://127.0.0.1:8200 ldap

vault login -method=ldap -address=http://127.0.0.1:8200 username=juser
    