import QtQuick 2.12
import QtQuick.Controls 2.2

Button{
    AppTheme{
        id: theme;
    }
    id: someId
    text: qsTr("someText")
    contentItem: Text {
        text: parent.text
        font.pixelSize: theme.fontSize
        opacity: enabled ? 1.0 : 0.3
        color: parent.down ? theme.buttonsTextColor : theme.buttonsTextColorPresed
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }
    width: theme.buttonsWidth
    height: theme.buttonsHeight
}
