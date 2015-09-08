PKGROOT       = /opt/lifemapper
LMHOME        = /opt/lifemapper
MAPSERVER_TMP = /var/www/tmp
LMWEB         = /var/lib/lm2
DATADIR       = /share/lmserver/data
TEMPDIR       = /tmp
PYTHONVER     = python2.7
PGSQLVER      = 9.1
LMDISK        = /share/lm
UNIXSOCKET    = /var/run/postgresql
SMTPSERVER    = localhost
SMTPSENDER    = no-reply-lifemapper@@PUBLIC_FQDN@

LMUSER                = lm2
DATASOURCE            = GBIF
SPECIES_DATA 	      = 
ALGORITHMS            = BIOCLIM,ATT_MAXENT
MODEL_SCENARIO        = WC-10min 
PROJECTION_SCENARIOS  = CCSM4-lgm-10min,CCSM4-mid-10min,CCSM4-RCP8.5-2070-10min,CCSM4-RCP4.5-2070-10min,CCSM4-RCP8.5-2050-10min,CCSM4-RCP4.5-2050-10min
SCENARIO_PACKAGE      = 10min-past-present-future
GRID_NAME             = lmgrid_1d
GRID_CELLSIZE         = 1
