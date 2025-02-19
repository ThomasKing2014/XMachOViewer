QT       += core gui widgets

TARGET = xmachoviewer

macx {
    TARGET = XMachOViewer
}

TEMPLATE = app

CONFIG += c++11

SOURCES += \
        guimainwindow.cpp \
        main_gui.cpp \
        dialogoptions.cpp \
        dialogabout.cpp

HEADERS += \
        dialogoptions.h \
        dialogabout.h \
        guimainwindow.h

FORMS += \
        dialogoptions.ui \
        dialogabout.ui \
        guimainwindow.ui

include($$PWD/../build.pri)

XCONFIG += use_disasm
XCONFIG += use_extrabuttons

!contains(XCONFIG, archive_widget) {
    XCONFIG += archive_widget
    include(../archive_widget/archive_widget.pri)
}

win32 {
    RC_ICONS = $$PWD/../icons/main.ico
    CONFIG -= embed_manifest_exe
    QMAKE_MANIFEST = windows.manifest.xml
}
macx {
    ICON = $$PWD/../icons/main.icns
}

RESOURCES += \
    rsrc.qrc

DISTFILES += \
    ../CMakeLists.txt \
    ../LICENSE \
    ../README.md \
    ../changelog.txt \
    ../release_version.txt \
    CMakeLists.txt


