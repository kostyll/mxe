# This file is pat of MXE.
# See index.html for further information.

PKG             := hiberlite
$(PKG)_VERSION  := 0.0.0
$(PKG)_CHECKSUM := d3e3be795e2bea5c40df980fe0ea0e639beb7a61
$(PKG)_SUBDIR   := $(PKG)-master
$(PKG)_FILE     := master.zip
$(PKG)_URL      := https://github.com/paulftw/hiberlite/archive/master.zip
$(PKG)_DEPS     := gcc sqlite

define $(PKG)_UPDATE
	echo "0.0.1" | \
	head -1
endef

define $(PKG)_BUILD
    # yasm is always static
    cd '$(1)'
    $(MAKE)
    $(MAKE) -C '$(1)' -j '$(JOBS)' install
endef
