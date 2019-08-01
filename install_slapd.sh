#!/bin/bash

sudo apt update

# Install openLDAP server quietly
export DEBIAN_FRONTEND=noninteractive

echo -e "
slapd slapd/root_password password admin
slapd slapd/root_password_again password admin
slapd slapd/internal/adminpw password admin
slapd slapd/internal/generated_adminpw password admin
slapd slapd/password2 password admin
slapd slapd/password1 password admin
slapd slapd/domain string clemson.cloudlab.us
slapd shared/organization string clemson.cloudlab.us
slapd slapd/backend string MDB
slapd slapd/purge_database boolean false
slapd slapd/move_old_database boolean true
slapd slapd/allow_ldap_v2 boolean false
slapd slapd/no_configuration boolean false
" |sudo debconf-set-selections

# Grab slapd and ldap-utils (pre-seeded)
sudo apt install -y slapd ldap-utils

# Enable firewall rule
sudo ufw allow ldap

# Populate LDAP
ldapadd -x -D cn=admin,dc=clemson,dc=cloudlab,dc=us -w admin -f /local/repository/basedn.ldif

# Generate password hash
PASS=$(slappasswd -s rammy)
cat<<EOF >/local/repository/users.ldif
dn: uid=student,ou=People,dc=clemson,dc=cloudlab,dc=us
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: student
sn: Ram
givenName: Golden
cn: student
displayName: student
uidNumber: 10000
gidNumber: 5000
userPassword:"$PASS"
gecos: Golden Ram
loginShell: /bin/dash
homeDirectory: /home/student
EOF

# Populate LDAP
ldapadd -x -D cn=admin,dc=clemson,dc=cloudlab,dc=us -w admin -f /local/repository/users.ldif

# Test LDAP
#ldapsearch -x -LLL -b dc=clemson,dc=cloudlab,dc=us 'uid=student' cn gidNumber

