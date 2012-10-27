#-------------------------------------------------
#
# Project created by QtCreator 2012-10-27T12:36:34
#
#-------------------------------------------------

QT       += core

QT       -= gui

TARGET = rilarmd
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    Rilarm_daemon.cpp

contains(MEEGO_EDITION,harmattan) {
    target.path = /opt/rilarm/bin
    INSTALLS += target
}

HEADERS += \
    Rilarm_daemon.h

OTHER_FILES += \
    rilarm.conf

daemonconf.path = /etc/init/apps
daemonconf.files = rilarm.conf
INSTALLS += daemonconf
