TEMPLATE = lib
CONFIG += plugin
QT -= gui
QT += core serialport qml

TARGET = $$qtLibraryTarget(sambaplugin_conn_serial)

DESTPATH = /

SOURCES += \
    sambaconnectionserialplugin.cpp \
    sambaconnectionserial.cpp \
    sambaconnectionportserial.cpp

HEADERS += \
    sambaconnectionserial.h \
    sambaconnectionportserial.h \
    sambaconnectionpluginserial.h

# include/link sambacommon library
INCLUDEPATH += $$PWD/../../../sambacommon
DEPENDPATH += $$PWD/../../../sambacommon
win32:CONFIG(release, debug|release):LIBS += -L$$OUT_PWD/../../../sambacommon/release/ -lsambacommon3
else:win32:CONFIG(debug, debug|release):LIBS += -L$$OUT_PWD/../../../sambacommon/debug/ -lsambacommon3
else:unix:LIBS += -L$$OUT_PWD/../../../sambacommon/ -lsambacommon

# set RPATH to $ORIGIN on Linux
unix:!mac:{
    QMAKE_LFLAGS += '-Wl,-rpath,\'\$$ORIGIN/lib\''
    QMAKE_RPATH =
}

# install
target.path = $$DESTPATH
INSTALLS += target