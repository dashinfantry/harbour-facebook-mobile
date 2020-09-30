function getHighlightBackgroundColor(index) {
    switch(index) {
    case 0:
        return Theme.secondaryHighlightColor;
    case 1:
        return "#6778c9";
    case 2:
        return "#292929";
    }
}

function getBackgroundColor(index) {
    switch(index) {
    case 0:
        return Theme.secondaryHighlightColor;
    case 1:
        return "#3b5998";
    case 2:
        return "#191919";
    }
}

function getHighlightColor(index) {
    switch(index) {
    case 0:
        return Theme.highlightColor;
    case 1:
        return "#6778c9";
    case 2:
        return "#696969";
    }
}

function getPrimaryColor(index) {
    switch(index) {
    case 0:
        return Theme.primaryColor;
    case 1:
        return "#f7f7f7";
    case 2:
        return "#AAAAAA";
    }
}

function getThemeFileName(index) {
    //prepared for theming support:
    switch(index) {
        case 0:
            return "qrc:////css/facebook-mobile-theme-ambience.css";
        case 1:
            return "qrc:////css/facebook-mobile-theme-facebook.css";
        case 2:
            return "qrc:////css/facebook-mobile-theme-night.css";
        default:
            console.error("Theme index not found")
    }
}

function handleImagePicker(filePicker) {
    var imageSelector = pageStack.push(Qt.resolvedUrl("../pages/ImageSelectorPage.qml"));
    imageSelector.finished.connect(function(){
        if(imageSelector.imageUrl.length > 0) {
            console.debug("User selected image: " + imageSelector.imageUrl);
            filePicker.accept(imageSelector.imageUrl.slice(7,imageSelector.imageUrl.length));
        }
        else {
            console.debug("User canceled image upload");
            filePicker.reject();
        }
    })
}
