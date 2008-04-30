# -*- makefile-gmake -*-

bin_PROGRAMS = ekeyring cxxtest

lib_LIBRARIES = libzardoz.a

libzardoz.a_SOURCES = zardoz.c

cxxtest_SOURCES = cxxtest.cc

ekeyring_SOURCES = ekeyring.c something.h
ekeyring_PACKAGES = gnome-keyring-1
ekeyring_CONFIG_HEADERS = config.h

config.h_FUNCTIONS = strcmp strdup
config.h_HEADERS = string.h nothing.h strings.h sys/types.h

data_SCRIPTS = ekeyring.c
data_DATA = something.h

EXTRA_DIST = README.simple

#ekeyring_LIBS = `pkg-config --libs gnome-keyring-1`
#ekeyring: CFLAGS += `pkg-config --cflags gnome-keyring-1`