#Specify the name of executable file.
LIB = usb

NOMAN = 1 # Describe to suppress creating man document

OS_DIR = ../os
PLATFORM_SRCS = ${OS_DIR}/events_posix.c ${OS_DIR}/threads_posix.c
OS_SRCS = ${OS_DIR}/netbsd_usb.c

#Specify the source file.
SRCS=core.c descriptor.c hotplug.c io.c strerror.c sync.c $(PLATFORM_SRCS) $(OS_SRCS)

CFLAGS+=-DGWNX
CFLAGS+=-DNDEBUG
CFLAGS+=-DPLATFORM_POSIX
CFLAGS+=-DHAVE_CLOCK_GETTIME
CFLAGS+=-DENABLE_DEBUG_LOGGING
CFLAGS+=-DENABLE_LOGGING
##CFLAGS+=-DDEFAULT_VISIBILITY=__attribute__ ((visibility ("hidden")))
##CFLAGS+=-v no verbosity
#temporary for compiling with debug info
CFLAGS+=-g
CFLAGS+=-w

CFLAGS+=-I. -I.. -I../os

LDADD+= -lpthread 
LIB_SHARED=no

#SHLIB_MAJOR=0 # Major version of the library to create. Required to create a shared library
#SHLIB_MINOR=0 # Minor version of the library to create

FIXEDLINK=

# Adjust the tooling to use the default NetBSD utility names.
# See: /proj/lpux/6.0/objects/comlib/i386/e.034/environment/tool/mk_netbsd/bsd.README
USETOOLS = yes

.include <bsd.own.mk>
.include <bsd.lib.mk>

dumpinfo:
	@echo SRCS=${SRCS}
	@echo INCS=${INCS}
	@echo ${CC} ${CFLAGS}
	@echo ${LD} ${LDFLAGS} ${LDADD}
	@echo -e "\n"
	@echo MAKEOBJDIR=${MAKEOBJDIR}
	@echo MAKEOBJDIRPREFIX=${MAKEOBJDIRPREFIX}
	@echo PRINTOBJDIR=${PRINTOBJDIR}
	@echo .PATH=${.PATH}
	@echo .CURDIR=${.CURDIR}
	@echo .OBJDIR=${.OBJDIR}
	@echo TOOLDIR=${TOOLDIR}
	@echo _TOOL_PREFIX=${_TOOL_PREFIX}
	@echo TSORT=${TSORT}

