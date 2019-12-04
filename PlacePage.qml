import QtQuick 2.12
import QtWebEngine 1.8
import QtQuick.Controls 2.12

Item {
    id: parentItem

    function showPage(url) {
        webView.url = url
    }

    focus: true
    Keys.onPressed: {
        switch (event.key) {
            case Qt.Key_Escape:
                console.log("esc pressed")
                parentItem.parent.source = "MainPage.qml"
                break;
        }
    }

    WebEngineView {
        id: webView
        anchors.fill: parent

        onContextMenuRequested: function(request) {
            request.accepted = true
        }

        property bool firstLoadComplete: false
        onLoadingChanged: function(loadRequest) {
            if (loadRequest.status === WebEngineView.LoadSucceededStatus
                && !firstLoadComplete) {
                // Debounce the showing of the web content, so images are more likely
                // to have loaded completely.
                showTimer.start()
            }
        }

        Rectangle {
            id: webViewPlaceholder
            anchors.fill: parent
            z: 1
            color: "white"

            BusyIndicator {
                id: busy
                anchors.centerIn: parent
            }
        }

        Timer {
            id: showTimer
            interval: 500
            repeat: false
            onTriggered: {
                webView.show(true)
                webView.firstLoadComplete = true
            }
        }

        function show(show) {
            if (show === true) {
                busy.running = false
                webViewPlaceholder.visible = false
            } else {
                webViewPlaceholder.visible = true
                busy.running = true
            }
        }

        Keys.onPressed: {
            switch (event.key) {
                case Qt.Key_Escape:
                    console.log("esc pressed")
                    parentItem.parent.source = "MainPage.qml"
                    break;
            }
        }
    }
}
