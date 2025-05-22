TARGET = ru.template.testing

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    rpm/ru.template.testing.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

QT += multimedia



TRANSLATIONS += \
    translations/ru.template.testing.ts \
    translations/ru.template.testing-ru.ts \

RESOURCES +=
