PKGROOT       = /opt/lifemapper
LMHOME        = /opt/lifemapper
MAPSERVER_TMP = /var/www/tmp
LMWEB         = /var/lib/lm2
LMURL			  = http://lifemapper.org/dl
DATADIR_SERVER  = /share/lmserver/data

# This variable is identical in the lifemapper-server roll
DATADIR_SHARED  = /share/lm/data

# This variable is identical to INPUT_LAYER_DIR in the lifemapper-compute roll
ENV_DATA_DIR  = layers
TEMPDIR       = /tmp
LMSCRATCHDISK = /state/partition1/lmscratch
PYTHONVER     = python2.7
PGSQLVER      = 9.1
UNIXSOCKET    = /var/run/postgresql
SMTPSERVER    = localhost
SMTPSENDER    = no-reply-lifemapper@@PUBLIC_FQDN@
JAVABIN       = /usr/java/latest/bin/java

SPECIES_DATA 	       = sorted_seasia_gbif
SCENARIO_PACKAGE      = 10min-past-present-future
GRID_NAME             = lmgrid_1d
GRID_CELLSIZE         = 1
