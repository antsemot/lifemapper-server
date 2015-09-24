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

LMUSER                = pragma
DATASOURCE            = PRAGMA
SPECIES_DATA 	      = iDigBio_20150513
ALGORITHMS            = BIOCLIM,ATT_MAXENT
MODEL_SCENARIO        = WC-30sec-SEA
PROJECTION_SCENARIOS  = CCSM4-RCP8.5-2070-30sec-SEA,CCSM4-RCP4.5-2050-30sec-SEA,CCSM4-RCP4.5-2070-30sec-SEA,CCSM4-RCP8.5-2050-30sec-SEA 
SCENARIO_PACKAGE      = 30sec-present-future-SEA
GRID_NAME             = lmgrid_1d
GRID_CELLSIZE         = 1
