import QtQuick 2.2
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0
import "pages"
import "./js/util.js" as Util

ApplicationWindow
{
    initialPage: Component { FacebookPage { } }
    cover: undefined
    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All

    // App settings
    ConfigurationGroup {
        id: settings
        path: "/apps/harbour-facebook-mobile/settings"

        property bool showLogout: false
        property int theme: 1
    }
}

