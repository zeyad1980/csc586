#!/bin/bash
sudo apt update

ldap-auth-config        ldap-auth-config/rootbindpw password admin
ldap_auth_config        ldap_auth_config/bindpw password admin
ldap_auth_config        ldap_auth_config/rootbindpw password admin
ldap-auth-config        ldap-auth-config/binddn string  cn=proxyuser,dc=example,dc=net
ldap-auth-config        ldap-auth-config/dbrootlogin    boolean true
ldap-auth-config        ldap-auth-config/pam_password   select  md5
ldap_auth_config        ldap_auth_config/dbrootlogin    boolean true
ldap-auth-config        ldap-auth-config/move-to-debconf        boolean true
ldap_auth_config        ldap_auth_config/ldapns/base-dn string  dc=clemson,dc=cloudlab,dc=us
ldap_auth_config        ldap_auth_config/rootbinddn     string  cn=admin,dc=clemson,dc=cloudlab,dc=us
ldap_auth_config        ldap_auth_config/ldapns/ldap-server     string  ldap://192.168.1.1
libpam-runtime  libpam-runtime/profiles multiselect     unix, ldap, systemd, capability
ldap_auth_config        ldap_auth_config/ldapns/ldap_version    select  3
ldap_auth_config        ldap_auth_config/dblogin        boolean false
ldap_auth_config        ldap_auth_config/override       boolean true 





sudo apt install -y libnss-ldap libpam-ldap ldap-utils

