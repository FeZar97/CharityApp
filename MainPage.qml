import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Page {

    id: mainPage

    AppTheme{
        id: theme
    }

    header: Rectangle {
        color: "#800af587"
        height: parent.height * 0.15;
        RowLayout {
            Label {
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Известные места неизвестных людей")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: theme.headerSize;
            }
            anchors.fill: parent
        }

    }

    contentItem: Item {
        id: content

        ColumnLayout {

            CButton {
                id: listButton
                Layout.preferredWidth: parent.width * 0.5
                Layout.preferredHeight: parent.height * 0.2
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Показать список мест")
                onClicked: {
                    mainPage.parent.source = "ListPage.qml"
                }
            }

            CButton {
                id: mapButton
                Layout.preferredWidth: parent.width * 0.5
                Layout.preferredHeight: parent.height * 0.2
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Показать карту")
                onClicked: {
                    mainPage.parent.source = "MapPage.qml"
                }
            }

            CButton {
                id: about
                Layout.preferredWidth: parent.width * 0.5;
                Layout.preferredHeight: parent.height * 0.2
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Об авторах")
                onClicked: {
                    mainPage.parent.source = "AboutPage.qml"
                }
            }

            CButton {
                id: exit
                Layout.preferredWidth: parent.width * 0.5;
                Layout.preferredHeight: parent.height * 0.2
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Выход")
                onClicked: {
                    Qt.quit()
                }
            }

            anchors.fill: parent
        }
    }
}

