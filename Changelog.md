# Changelog

## 14.2.4

### New

* version update with fix for logadm. [Thomas Merkel]

### Changes

* log to extra file to have a working logadm. [Thomas Merkel]

## 14.2.3 (2014-10-01)

### New

* change php default variables. [Thomas Merkel]

### Changes

* update changelog. [Thomas Merkel]

## 14.2.2 (2014-09-27)

### New

* update to new core-base image 43aaede4-4622-11e4-a839-d3704910e498. [Thomas Merkel]

## 14.2.1 (2014-09-25)

### Other

* add changelog. [Thomas Merkel]
* add changelog. [Thomas Merkel]
* version update. [Thomas Merkel]
* update to new core-base image: a6fb1ff0-4333-11e4-a0e1-370c81688134. [Thomas Merkel]
* update to new core-base image: 6babbf24-3765-11e4-a87a-23e846a65e81. [Thomas Merkel]
* update to new core-base image: 99c9e7ac-34ed-11e4-bdc4-236f63b1ea9d. [Thomas Merkel]
* update readme file. [Thomas Merkel]
* update to new core-base image: 89402478-34cf-11e4-ac94-f3a4d047918f. [Thomas Merkel]
* update to new core-base image: aed27f7a-34c4-11e4-be6c-4392ae5601bc. [Thomas Merkel]
* update to new core-base image: 5f749f3c-335f-11e4-a952-e780d226fa57. [Thomas Merkel]
* update to new core-base image: fbd244a6-32bf-11e4-8629-73c3e6ed202d. [Thomas Merkel]
* update to new core-base image: 86465fe4-312d-11e4-a145-57554f40fa40. [Thomas Merkel]
* move munin config back to customize script. [Thomas Merkel]
* update base image. [Thomas Merkel]
* Update to the new version 14.2.0 and to mi-core-base. [Thomas Merkel]
* holy munin - fixed typo. [BroSys]
* update munin plugins to new version 0.2. [Thomas Merkel]
* Create munin template file that will be used during mdata setup. [Thomas Merkel]
* Download and install community munin plugins. [Thomas Merkel]
* use includes folder for mdata information. [Thomas Merkel]
* use -s option for mdata enable. [Thomas Merkel]
* fix plugin check for different munin stuff. [Thomas Merkel]
* missing munin plugin variables. [Thomas Merkel]
* Add munin-node for monitoring. [Thomas Merkel]

    * enable default munin-plugins * enable nginx munin-plugins

* Enable plugins for roundcube. [Thomas Merkel]

    * be sure all roundcube plugins are installed and configured

* other random function. [Thomas Merkel]
* cryptkey must be 24byte. [Thomas Merkel]
* Enable some default plugins that are nice to have. [Thomas Merkel]
* setup config on prov. state with default values. [Thomas Merkel]
* add mdata setup xml. [Thomas Merkel]
* remove unused updates and mkdir fix. [Thomas Merkel]
* create random key via openssl. [Thomas Merkel]
* read all mdata information and create config file. [Thomas Merkel]

    * create config.inc.php for roundcube * fix typo in README

* cleanup and rename mdata files. [Thomas Merkel]

    * create ssl folder for nginx * update readme with parameters for
    mdata * remove installer folder from roundcube

* download and install roundcube. [Thomas Merkel]

    * download roundcube to /var/www/roundcubemail * be sure timezone is
    set correct * change default manifest

* requirements, php configs, extensions, nginx config. [Thomas Merkel]

    * add all required pkgs for roundcube * enable extensions via php *
    configure nginx for php-fpm * configure php-fpm to use socket * copy
    mdata-setup scripts

* First commit with default files from the example. [Thomas Merkel]

