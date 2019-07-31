#!/bin/bash
sudo apt update

sudo ldap-auth-config        ldap-auth-config/rootbindpw password admin
sudo ldap_auth_config        ldap_auth_config/bindpw password admin
sudo ldap_auth_config        ldap_auth_config/rootbindpw password admin
sudo ldap-auth-config        ldap-auth-config/binddn string  cn=proxyuser,dc=example,dc=net
sudo ldap-auth-config        ldap-auth-config/dbrootlogin    boolean true
sudo ldap-auth-config        ldap-auth-config/pam_password   select  md5
sudo ldap_auth_config        ldap_auth_config/dbrootlogin    boolean true
sudo ldap-auth-config        ldap-auth-config/move-to-debconf        boolean true
sudo ldap_auth_config        ldap_auth_config/ldapns/base-dn string  dc=clemson,dc=cloudlab,dc=us
sudo ldap_auth_config        ldap_auth_config/rootbinddn     string  cn=admin,dc=clemson,dc=cloudlab,dc=us
sudo ldap_auth_config        ldap_auth_config/ldapns/ldap-server     string  ldap://192.168.1.1
sudo libpam-runtime  libpam-runtime/profiles multiselect     unix, ldap, systemd, capability
sudo ldap_auth_config        ldap_auth_config/ldapns/ldap_version    select  3
sudo ldap_auth_config        ldap_auth_config/dblogin        boolean false
sudo ldap_auth_config        ldap_auth_config/override       boolean true 





sudo apt install -y libnss-ldap libpam-ldap ldap-utils

