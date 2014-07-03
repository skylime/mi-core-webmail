# mi-core-webmail

Please refer to https://github.com/joyent/mibe for use of this repo.

## description


## mdata variables

- `product_name` (required): The name of your service (used to compose page titles)
- `support_url`: Provide an URL where a user can get support for this Roundcube installation
- `skin_logo`: Custom image to display instead of the Roundcube logo
- `ip_check`: Check client IP in session authorization

- `db_dsnw` (required): Database settings for read/write operations, mysql://roundcube:@localhost/roundcubemail

- `imap_host` (required): The IMAP host(s) chosen to perform the log-in
- `imap_port` (required): TCP port used for IMAP connections
- `smtp_server` (required): Use this host for sending mails, ssl://smtp.host.com
- `smtp_port` (required): TCP port used for SMTP connections

- `nginx_ssl` (required): ssl cert, key and CA for imaps and pop3s in pem format

## services

- `80/tcp`: http redirect to https
- `443/tcp`: https webinterface for roundcube
