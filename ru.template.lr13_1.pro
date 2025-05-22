TARGET = ru.template.lr13_1

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/SumDialog.qml \
    rpm/ru.template.lr13_1.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

QT += multimedia

TRANSLATIONS += \
    translations/ru.template.lr13_1.ts \
    translations/ru.template.lr13_1-ru.ts \

RESOURCES += \
    qml/sources.qrc
