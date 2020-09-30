TARGET = harbour-facebook-mobile

i18n.path = /usr/share/harbour-facebook-mobile/translations
i18n.files = translations/harbour-facebook-mobile-nl.qm

INSTALLS += i18n

# automatic generation of the translation .qm files from .ts files
system(lrelease $$PWD/translations/*.ts)

CONFIG += sailfishapp

# Write version file
VERSION_H = \
"$${LITERAL_HASH}ifndef FACEBOOK_MOBILE_VERSION" \
"$${LITERAL_HASH}   define FACEBOOK_MOBILE_VERSION \"$$VERSION\"" \
"$${LITERAL_HASH}endif"
write_file($$$$OUT_PWD/facebook_mobile_version.h, VERSION_H)

SOURCES += src/harbour-facebook-mobile.cpp

OTHER_FILES += qml/harbour-facebook-mobile.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-facebook-mobile.changes.in \
    rpm/harbour-facebook-mobile.spec \
    rpm/harbour-facebook-mobile.yaml \
    harbour-facebook-mobile.desktop \
    qml/pages/FacebookPage.qml \
    qml/pages/AboutPage.qml \
    qml/pages/ImageSelectorPage.qml \
    qml/pages/ImagePicker.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/components/ClickableLabel.qml \
    qml/pages/components/IconTextButton.qml \
    qml/pages/components/AboutLabel.qml \
    qml/pages/components/CollaboratorsLabel.qml \
    qml/pages/components/NotificationPanel.qml \
    qml/pages/components/ProgressPanel.qml \
    qml/pages/components/SelectionPanel.qml \
    qml/pages/components/InteractionBlocker.qml \
    qml/pages/components/Spacer.qml \
    qml/pages/components/MyHighlightImage3.qml \
    qml/pages/components/PlainButton.qml \
    qml/pages/components/LabelSpacer.qml \
    qml/pages/components/ScreenBlank.qml \
    qml/pages/helper/facebook.js \
    translations/*.ts

DISTFILES += \
    qml/js/util.js

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172 256x256

CONFIG += sailfishapp_i18n

TRANSLATIONS += \
    translations/harbour-facebook-mobile-nl.ts

RESOURCES += \
    qml/resources/resources.qrc
