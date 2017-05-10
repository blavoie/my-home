#
# Test under Alpine:
#   docker run --rm -i -t python:2-alpine sh
#
#   apk update
#   apk add ca-certificates build-base openldap-dev
#   pip install python-ldap
#
#

import ldap

ldap.set_option(ldap.OPT_NETWORK_TIMEOUT, 5)
ldap.set_option(ldap.OPT_PROTOCOL_VERSION, ldap.VERSION3)

#
# Useful under some OSes?
# Was necessary for Alpine Linux (with ca-certificates package)
# Was getting this error:
#   ldap.SERVER_DOWN: {'info': 'error:14090086:SSL routines:ssl3_get_server_certificate:certificate verify failed (self signed certificate in certificate chain)', 'desc': "Can't contact LDAP server"}
#
if not ldap.get_option(ldap.OPT_X_TLS_CACERTDIR):
    ldap.set_option(ldap.OPT_X_TLS_CACERTDIR, '/etc/ssl/certs')

ld = ldap.initialize('ldaps://ldap.YOUR.BUSINESS.COM')
ld.simple_bind_s('<DOMAIN>\\' + '<USERNAME>', '<PASSWORD>')    

    
