#!/bin/bash
sudo apt update

#echo -e "ldap_auth_config        ldap_auth_config/ldapns/ldap-server     string  ldap://192.168.1.1" |sudo debconf-set-selections
echo -e "ldap-auth-config        ldap-auth-config/rootbindpw password admin" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/bindpw password admin" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/rootbindpw password admin" |sudo debconf-set-selections
echo -e "ldap-auth-config        ldap-auth-config/binddn string  cn=student,dc=example,dc=net" |sudo debconf-set-selections
echo -e "ldap-auth-config        ldap-auth-config/dbrootlogin    boolean true" |sudo debconf-set-selections
echo -e "ldap-auth-config        ldap-auth-config/pam_password   select  md5" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/dbrootlogin    boolean true" |sudo debconf-set-selections
echo -e "ldap-auth-config        ldap-auth-config/move-to-debconf        boolean true" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/ldapns/base-dn string  dc=clemson,dc=cloudlab,dc=us" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/rootbinddn     string  cn=admin,dc=clemson,dc=cloudlab,dc=us" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/ldapns/ldap-server     string  ldap://192.168.1.1" |sudo debconf-set-selections
echo -e "libpam-runtime  libpam-runtime/profiles multiselect     unix, ldap, systemd, capability" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/ldapns/ldap_version    select  3" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/dblogin        boolean false" |sudo debconf-set-selections
echo -e "ldap_auth_config        ldap_auth_config/override       boolean true"  |sudo debconf-set-selections



sudo apt install -y libnss-ldap libpam-ldap ldap-utils



sudo getent passwd student
sudo su - student





