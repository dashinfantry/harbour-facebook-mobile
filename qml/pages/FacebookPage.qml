import QtQuick 2.2
import Sailfish.Silica 1.0
import QtWebKit 3.0
import "../js/util.js" as Util

Page {
    id: page
    backNavigation: false
    forwardNavigation: false
    showNavigationIndicator: false
    allowedOrientations: Orientation.All

    Rectangle {
        color: Util.getBackgroundColor(settings.theme)
        }

    DockedPanel {
        id: navPanel
        dock: Dock.Bottom
        width: parent.width
        height: Theme.itemSizeSmall
        open: true
        _immediate: true

        Rectangle {
            width: parent.width
            height: parent.height
            color: Util.getBackgroundColor(settings.theme)

        Row {
            anchors.centerIn: parent
            spacing: Theme.paddingLarge
            IconButton {
                icon.source: "image://theme/icon-m-back"
                onClicked: webView.goBack()
                enabled: webView.canGoBack
            }
        }
    }
 }

    SilicaWebView {
        id: webView
        anchors {
            fill: parent
            bottomMargin: navPanel.visibleSize
        }
        quickScroll: false
        url: "https://www.facebook.com"
        overridePageStackNavigation: true
        experimental.transparentBackground: true
        experimental.userAgent: "Mozilla/5.0 (Maemo; Linux; U; Jolla; Sailfish; Android 2.3.5) AppleWebKit/538.1 (KHTML, like Gecko) Version/5.1 Chrome/30.0.0.0 Mobile Safari/538.1 (compatible)"
        experimental.preferences.javascriptEnabled: true
        experimental.preferences.developerExtrasEnabled: true
        experimental.filePicker: ImagePicker { filePicker: model }
        onNavigationRequested: {
            if(Media.detectImage(request)) { // When link is an image, cancel request and show our image viewer
                request.action = WebView.IgnoreRequest;
            }
        }
        experimental.userStyleSheets: Qt.resolvedUrl(Util.getThemeFileName(settings.theme))
        experimental.userScripts: [
            Qt.resolvedUrl("helper/facebook.js")
        ]
        experimental.preferences.navigatorQtObjectEnabled: true
        experimental.preferences.fullScreenEnabled: true
        experimental.preferences.offlineWebApplicationCacheEnabled: true
        onTitleChanged: {

        }

        VerticalScrollDecorator {
            color: Theme.highlightColor // Otherwise we might end up with white decorator on white background
            width: Theme.paddingSmall // We want to see it properly
            flickable: webview
        }

        HorizontalScrollDecorator {  // Yeah necessary for larger images and other large sites or zoomed in sites
            parent: page
            color: Theme.highlightColor // Otherwise we might end up with white decorator on white background
            height: Theme.paddingSmall // We want to see it properly
            flickable: webview
            anchors.bottom: page.bottom
        }    

        PullDownMenu {
            MenuItem {
                color: Util.getPrimaryColor(settings.theme)
                text: qsTr("About Facebook Mobile")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }

            MenuItem {
                color: Util.getPrimaryColor(settings.theme)
                text: qsTr("Settings")
                onClicked: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }

            MenuItem {
                color: Util.getPrimaryColor(settings.theme)
                text: navPanel.open ? qsTr("Hide navigation bar")
                                : qsTr("Open navigation bar")
                onClicked: {
                    navPanel.open ? navPanel.open = false : navPanel.open = true
                }
            }

            MenuItem {
                color: Util.getPrimaryColor(settings.theme)
                text: qsTr("Facebook logout")
                visible: settings.showLogout
                onClicked: logout()
            }

            MenuItem {
                color: Util.getPrimaryColor(settings.theme)
                text: qsTr("Refresh")
                onClicked: {
                      refresh()
            }
        }
    }
}

        function logout() {
            webView.experimental.deleteAllCookies();
            webView.reload()
   }

        function refresh() {
            webView.reload()
   }
}

