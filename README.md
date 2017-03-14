# mi-core-webmail

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## description

Create zone that contains nginx, php with roundcube web interface for webmail
support. It still requires a working database server that already contains the
[roundcube database scheme](https://github.com/roundcube/roundcubemail/blob/master/SQL/mysql.initial.sql).

Enabled plugins are:

- managesieve
- zipdownload
- [html5_notifier](https://github.com/kitist/html5_notifier)

This image is part of the following images:

- [mi-core-mailapi](https://github.com/skylime/mi-core-mailapi)
- [mi-core-mx](https://github.com/skylime/mi-core-mx)
- [mi-core-submission](https://github.com/skylime/mi-core-submission)
- [mi-core-mbox](https://github.com/skylime/mi-core-mbox)
- [mi-core-webmail](://github.com/skylime/mi-core-webmail)

## mdata variables

- `product_name` `[*]`: The name of your service (used to compose page titles)
- `support_url`: Provide an URL where a user can get support for this Roundcube installation
- `skin_logo`: Custom image to display instead of the Roundcube logo
- `ip_check`: Check client IP in session authorization

- `db_dsnw` `[*]`: Database settings for read/write operations, mysql://roundcube:@localhost/roundcubemail

- `imap_server` `[*]`: The IMAP host(s) chosen to perform the log-in, imap.host.com
- `smtp_server` `[*]`: Use this host for sending mails, smtp.host.com

- `nginx_ssl` `[*]`: ssl cert, key and CA for imaps and pop3s in pem format

`[*]` is required to work properly.

## services

- `80/tcp`: http redirect to https
- `443/tcp`: https webinterface for roundcube
