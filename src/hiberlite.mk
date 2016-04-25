# This file is pat of MXE.
# See index.html for further information.

PKG             := hiberlite
$(PKG)_VERSION  := 0.0.0
$(PKG)_CHECKSUM := afd2e27d72409f26aeb1b790537d9c2d7755307d4a24228bbe848d0258ca7a08
$(PKG)_SUBDIR   := $(PKG)-master
$(PKG)_FILE     := master.zip
$(PKG)_URL      := https://github.com/paulftw/hiberlite/archive/master.zip
$(PKG)_DEPS     := gcc sqlite

define $(PKG)_UPDATE
	echo "0.0.1" | \
	head -1
endef

define $(PKG)_BUILD
    cd '$(1)'
    echo "8c8" > $(1)/Makefile.patch
    echo "< OBJS=BeanLoader.o BeanUpdater.o ChildKiller.o CppModel.o Database.o ModelExtractor.o Registry.o SQLiteStmt.o Visitor.o shared_res.o" >> $(1)/Makefile.patch
    echo "---" >> $(1)/Makefile.patch
    echo "> OBJS=BeanLoader.o BeanUpdater.o ChildKiller.o CppModel.o Database.o ModelExtractor.o Registry.o SQLiteStmt.o Visitor.o shared_res.o sqlite3.o" >> $(1)/Makefile.patch
    echo "11c11" >> $(1)/Makefile.patch
    echo "< LDFLAGS=-lpthread -lsqlite3 -ldl" >> $(1)/Makefile.patch
    echo "---" >> $(1)/Makefile.patch
    echo "> LDFLAGS=-lpthread -ldl" >> $(1)/Makefile.patch
    patch $(1)/Makefile -R < $(1)/Makefile.patch
    $(MAKE) -C '$(1)' -j '$(JOBS)' libhiberlite.a INSTALL_PREFIX='$(PREFIX)/$(TARGET)'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install INSTALL_PREFIX='$(PREFIX)/$(TARGET)'
endef
