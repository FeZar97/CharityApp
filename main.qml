import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: appWindow
    title: qsTr("Известные места неизвестных людей")
    visible: true

    width: 1220
    height: 680

    Loader {
        id: loader
        source: "MainPage.qml"
        anchors.fill: parent

        function showCoordinate(lat, lon, zoomLevel) {
            source = "MapPage.qml"
            loader.item.setCenterCoordinate(lat, lon, zoomLevel)
        }

        function showPage(url) {
            source = "PlacePage.qml"
            loader.item.showPage(url)
        }
    }
}
