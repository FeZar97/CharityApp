import QtQuick 2.12
import QtPositioning 5.11

Item {
    id: parentItem

    AppTheme { id: theme }

    Places { id: places }

    signal showCoordinate(real lat, real lon)

    ListView {
          anchors.fill: parent

          model: places

          delegate:

              Component {
                  Rectangle {
                      height: parentItem.height / 10
                      width: parentItem.width

                      Row {
                          spacing: 10
                          padding: 10

                          Marker {}
                          Column {
                              Text { text: name; font.bold: true }
                              Text { text: description }
                          }
                      }

                      MouseArea {
                          anchors.fill: parent
                          onClicked: {
                              parentItem.parent.showCoordinate(latitude, longitude, zoomLevel)
                          }
                      }
                  }
              }
    }

    focus : true
    Keys.onPressed: {
        switch (event.key) {
            case Qt.Key_Escape:
                parent.source = "MainPage.qml"
                break;
        }
    }
}
