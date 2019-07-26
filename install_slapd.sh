#!/bin/bash
export DEBIAN_FRONTEND='non-interactive'

echo -e "slapd slapd/root_password password KappaRoss" |debconf-set-selections
echo -e "slapd slapd/root_password_again password KappaRoss" |debconf-set-selections

echo -e "slapd slapd/internal/adminpw password test" |debconf-set-selections
echo -e "slapd slapd/internal/generated_adminpw password test" |debconf-set-selections
echo -e "slapd slapd/password2 password test" |debconf-set-selections
echo -e "slapd slapd/password1 password test" |debconf-set-selections
echo -e "slapd slapd/domain string acu.local" |debconf-set-selections
echo -e "slapd shared/organization string IT410" |debconf-set-selections
echo -e "slapd slapd/backend string HDB" |debconf-set-selections
echo -e "slapd slapd/purge_database boolean true" |debconf-set-selections
echo -e "slapd slapd/move_old_database boolean true" |debconf-set-selections
echo -e "slapd slapd/allow_ldap_v2 boolean false" |debconf-set-selections
echo -e "slapd slapd/no_configuration boolean false" |debconf-set-selections
