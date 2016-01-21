#!/bin/bash
# Configure roundcube to connect to the mailserver and db server

ROUNDCUBE_PATH='/var/www/roundcubemail'
ROUNDCUBE_CONF=${ROUNDCUBE_PATH}'/config/config.inc.php'

# default values for imap and smtp port
IMAP_PORT=${IMAP_PORT-$(mdata-get imap_port)} || \
	IMAP_PORT=993;
SMTP_PORT=${SMTP_PORT-$(mdata-get smtp_port)} || \
	SMTP_PORT=465;

# configure roundcube (required)
cat ${ROUNDCUBE_CONF}.provision > ${ROUNDCUBE_CONF}
cat << EOF >> ${ROUNDCUBE_CONF}
// SETUP VIA MDATA
\$config['smtp_helo_host'] = "$(hostname)";

\$config['product_name'] = "$(mdata-get product_name)";

\$config['db_dsnw']      = "$(mdata-get db_dsnw)";

\$config['default_host'] = "$(mdata-get imap_host)";
\$config['default_port'] = "${IMAP_PORT}";

\$config['smtp_server']  = "$(mdata-get smtp_server)";
\$config['smtp_port']    = "${SMTP_PORT}";
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

# configure carddav plugin
cat << EOF >> ${ROUNDCUBE_PATH}'/plugins/carddav/config.inc.php'
<?php
// RCMCardDAV Plugin Admin Settings
// ** GLOBAL SETTINGS

// Disallow users to add / edit / delete custom addressbooks (default: false)
// If true, User cannot add custom addressbooks
// If false, user can add / edit / delete custom addressbooks
\$prefs['_GLOBAL']['fixed'] = false;
EOF

# for standalone usage create sqlite database (if used in db_dsnw)
if [[ $(mdata-get db_dsnw) =~ "sqlite" ]]; then
	db_file=$(mdata-get db_dsnw | sed 's|.*:/*|/|g')
	if [[ ! -e "${db_file}" ]]; then
		sqlite3 ${db_file} < ${ROUNDCUBE_PATH}'/SQL/sqlite.initial.sql'
		sqlite3 ${db_file} < ${ROUNDCUBE_PATH}'/plugins/carddav/dbinit/sqlite3.sql'
		chown www:www ${db_file}
	fi
fi
