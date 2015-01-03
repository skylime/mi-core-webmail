#!/bin/bash
# Configure roundcube to connect to the mailserver and db server

ROUNDCUBE_PATH='/var/www/roundcubemail'
ROUNDCUBE_CONF=${ROUNDCUBE_PATH}'/config/config.inc.php'

# configure roundcube (required)
cat ${ROUNDCUBE_CONF}.provision > ${ROUNDCUBE_CONF}
cat << EOF >> ${ROUNDCUBE_CONF}
// SETUP VIA MDATA
\$config['smtp_helo_host'] = "$(mdata-get sdc:hostname)";

\$config['product_name'] = "$(mdata-get product_name)";

\$config['db_dsnw']      = "$(mdata-get db_dsnw)";

\$config['default_host'] = "$(mdata-get imap_host)";
\$config['default_port'] = "$(mdata-get imap_port)";

\$config['smtp_server']  = "$(mdata-get smtp_server)";
\$config['smtp_port']    = "$(mdata-get smtp_port)";
EOF

# configure roundcube (not required)
if mdata-get support_url 1>/dev/null 2>&1; then
	echo "\$config['support_url']  = \"$(mdata-get support_url)\";" >> ${ROUNDCUBE_CONF}
fi
if mdata-get skin_logo 1>/dev/null 2>&1; then
	echo "\$config['skin_logo']    = \"$(mdata-get skin_logo)\";" >> ${ROUNDCUBE_CONF}
fi
if mdata-get ip_check 1>/dev/null 2>&1; then
	echo "\$config['ip_check']     = $(mdata-get ip_check)" >> ${ROUNDCUBE_CONF}
fi

# configure sieve plugin
cat << EOF >> ${ROUNDCUBE_PATH}'/plugins/managesieve/config.inc.php'
<?php
\$config['managesieve_host'] = "tls://%h";
EOF
