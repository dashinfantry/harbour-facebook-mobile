import QtQuick 2.2
import Sailfish.Silica 1.0
import "../js/util.js" as Util

Item {
    property var filePicker

    Component.onCompleted: Util.handleImagePicker(filePicker)
}
