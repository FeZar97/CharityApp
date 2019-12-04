import QtQuick 2.12

ListModel {
    id: generalListModel

    ListElement {
        name: "Останкино"
        description: "Высота 540,1, а седьмое небо лишь на 337"

        url: "qrc:///pages/Ostankino.html"

        zoomLevel: 17.8

        latitude: 55.819657
        longitude: 37.611653
    }

    ListElement {
        name: "Охотничий домик"
        description: "Да не, это не он, он должен быть белым... Или нет?"

        url: "qrc:///pages/HuntingLodge.html"

        zoomLevel: 17.9

        latitude: 55.714500
        longitude: 37.584395
    }
}
