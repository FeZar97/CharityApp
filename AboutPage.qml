import QtQuick 2.12
import QtQuick.Controls 2.2

Item {
    AppTheme{
        id: theme;
    }

    id: aboutPage
    signal exit
    property string type: qsTr("about")
    Rectangle {
        color: theme.backgroundColor
        anchors.fill: parent
    }

    // Image {
    //     x: 0
    //     y: 0
    //     width: parent.width
    //     height: parent.height * 0.2
    //     fillMode: Image.PreserveAspectFit
    //     source: "/res/icon.ico"
    // }

    Label {
        id: txt
        x: parent.width * 0.1
        y: parent.height * 0.3
        width: parent.width * 0.8
        height: parent.height * 0.6
        color: theme.buttonsTextColor
        font.pixelSize: (aboutPage.width < aboutPage.height) ? aboutPage.width / 25 : aboutPage.height / 25
        font.italic: true
        wrapMode: Text.Wrap
        text: qsTr("Product of 'Art Union 2+1'
                  * Developers: Darya Valeria Fedor
                  * Programmer: FeZar97
                  * This program is distributed under the LGPLv3 license.
                  * Contact: https://github.com/FeZar97
                  * Copyright (C) 2019 FeZar97")
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            aboutPage.parent.source = "MainPage.qml"
        }
    }
}
