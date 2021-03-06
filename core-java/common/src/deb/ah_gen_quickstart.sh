#!/bin/sh -e

. /usr/share/debconf/confmodule
. /usr/share/arrowhead/conf/ahconf.sh

if [ "$#" -lt 1 ]; then
    echo "Syntax: ${0} HOST"
    exit 1
fi

HOST=${1}

ah_gen_system client1 ${HOST} 8080
echo >&2
ah_gen_system SecureTemperatureSensor ${HOST} 8461 IndoorTemperature
echo >&2
echo "WARNING: No authorization/orchestration entries will be generated by this version of the script" >&2

# TODO Autogenerated ids
#mysql -u root arrowhead <<EOF
#LOCK TABLES arrowhead_system WRITE, arrowhead_service WRITE, intra_cloud_authorization WRITE, orchestration_store WRITE;
#
#INSERT INTO intra_cloud_authorization VALUES (1, 1, 2, 1);
#INSERT INTO orchestration_store VALUES (1, 'Y', NULL, NOW(), 'Test', 1, 1, NULL, 2, 1);
#
#UNLOCK TABLES;
#EOF
