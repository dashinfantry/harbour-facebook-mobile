import QtQuick 2.2
import Sailfish.Silica 1.0
import "../js/util.js" as Util

Dialog {

    onAccepted: {
        settings.showNavbar = showNavbar.checked
        settings.showLogout = showLogout.checked
        settings.showRefresh = showRefresh.checked
        settings.theme = theme.currentIndex
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: settingsColumn.height

        VerticalScrollDecorator {}

        Column {
            id: settingsColumn
            width: parent.width
            spacing: Theme.paddingLarge

            DialogHeader { title: qsTr("Settings") }

            SectionHeader{ text: qsTr("Appearance") }

            ComboBox {
                id: theme
                label: qsTr("Theme")
                currentIndex: settings.theme
                menu: ContextMenu {
                    MenuItem { text: qsTr("Ambience") }
                    MenuItem { text: qsTr("Facebook") }
                    MenuItem { text: qsTr("Facebook nightmode") }
                }
            }

            TextSwitch {
                id: showNavbar
                text: qsTr("Show Navigation bar pulldown menu")
                checked: settings.showNavbar
            }

            TextSwitch {
                id: showLogout
                text: qsTr("Show Facebook logout pulldown menu")
                checked: settings.showLogout
            }

            TextSwitch {
                id: showRefresh
                text: qsTr("Show Refresh pulldown menu")
                checked: settings.showRefresh
            }
        }
    }
}
