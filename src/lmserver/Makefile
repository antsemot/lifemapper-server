# $Id$
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

version.mk:
	cat ../version.mk version.mk.in > version.mk

PY.PATH = /opt/python/bin/$(PYTHONVER)

YR=`date +'%Y'`
MO=`date +'%_m'`
DY=`date +'%_d'`

SEDSPEC += \
        -e 's%@PKGROOT@%$(PKGROOT)%g' \
        -e 's%@LMDISK@%$(LMDISK)%g' \
        -e 's%@PYBIN@%$(PY.PATH)%g' \
        -e 's%@PYTHONVER@%$(PYTHONVER)%g' \
        -e 's%@PGSQLVER@%$(PGSQLVER)%g' \
        -e 's%@LMCODE_VERSION@%$(LMCODE_VERSION)%g' \
        -e 's%@LMVIZ_VERSION@%$(LMVIZ_VERSION)%g' \
        -e 's%@DATADIR_SERVER@%$(DATADIR_SERVER)%g' \
        -e 's%@DATADIR_SHARED@%$(DATADIR_SHARED)%g' \
        -e 's%@SPECIES_DATA_DIR@%$(SPECIES_DATA_DIR)%g' \
        -e 's%@PACKAGING_DIR@%$(PACKAGING_DIR)%g' \
        -e 's%@LMHOME@%$(LMHOME)%g' \
        -e 's%@SMTPSERVER@%$(SMTPSERVER)%g' \
        -e 's%@LMSCRATCHDISK@%$(LMSCRATCHDISK)%g' \
        -e 's%@VERSION@%$(VERSION)%g' \
        -e 's%@REPONAME@%$(REPONAME)%g' \
        -e 's%@NAME@%$(NAME)%g' \
        -e 's%@TARBALL_POSTFIX@%$(TARBALL_POSTFIX)%g' \
        -e 's%@SCENARIO_PACKAGE@%$(SCENARIO_PACKAGE)%g' \
        -e 's%@ECOREGION_LAYER@%$(ECOREGION_LAYER)%g' \
        -e 's%@EPSG@%$(EPSG)%g' \
        -e 's%@PUBLIC_USER@%$(PUBLIC_USER)%g' \
        -e 's%@MAPUNITS@%$(MAPUNITS)%g' \
        -e 's%@JAVABIN@%$(JAVABIN)%g' \
        -e 's%@GRID_NAME@%$(GRID_NAME)%g' \
        -e 's%@GRID_CELLSIZE@%$(GRID_CELLSIZE)%g' \
        -e 's%@GRID_NUM_SIDES@%$(GRID_NUM_SIDES)%g' \
        -e 's%@GBIF_VERSION@%$(GBIF_VERSION)%g' \
        -e 's%@GBIF_TAXONOMY@%$(GBIF_TAXONOMY)%g' \
        -e 's%@GBIF_OCCURRENCES@%$(GBIF_OCCURRENCES)%g' \
        -e 's%@GBIF_PROVIDER@%$(GBIF_PROVIDER)%g' \
        -e "s%@SPECIES_EXP_YEAR@%$(YR)%g" \
        -e "s%@SPECIES_EXP_MONTH@%$(MO)%g" \
        -e "s%@SPECIES_EXP_DAY@%$(DY)%g"

SCRIPTS = config.lmserver.ini \
          boom.public.params \
          cherrypy.conf
          
TOPDIR =  $(REPONAME)-$(VERSION)

config.lmserver.ini: $(TOPDIR)/LmServer/config/config.lmserver.ini.in
	$(SED) -i $(SEDSPEC) $^ 
	cat $^ > $(TOPDIR)/config/$@
	cp $(TOPDIR)/config/$@ $(TOPDIR)/config/config.site.ini.lmserver_example 

cherrypy.conf: $(TOPDIR)/LmWebServer/config/cherrypy.conf.in
	$(SED) -i $(SEDSPEC) $^ 
	cat $^ > $(TOPDIR)/config/$@

boomInit.sample.ini:
	cat $(TOPDIR)/LmServer/config/$@ > $(TOPDIR)/config/$@

boom.public.params: $(TOPDIR)/LmServer/config/boom.public.params.in
	$(SED) -i $(SEDSPEC) $^ 
	cat $^ > $(TOPDIR)/config/$@

prepSrc.sh: prepSrc.sh.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

prep: prepSrc.sh
	rm -rf version.mk
	make version.mk
	make prepSrc.sh
	./prepSrc.sh

build: 
	tar xzvf $(NAME)-$(VERSION).tar.gz  
	make $(SCRIPTS)
	make $(SERVICES)

install::
	mkdir -p $(ROOT)/$(LMHOME)
	mv $(TOPDIR)/*  $(ROOT)/$(LMHOME) 
	
clean::
	rm -rf  $(SCRIPTS)  
	rm -rf  $(TOPDIR)
	rm -rf  version.mk prepSrc.sh
