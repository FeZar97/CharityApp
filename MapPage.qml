/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
import QtQuick 2.12
import QtQuick.Controls 2.12
import QtPositioning 5.5
import QtLocation 5.6

Item {
    id: parentItem

    Places { id: places }

    anchors.fill: parent

    Plugin {
        id: myPlugin
        name: "esri" // "osm", "mapboxgl", "esri", ...
    }

    property variant centerCoordinate: QtPositioning.coordinate(55.743244, 37.659121)

    function setCenterCoordinate(lat, lon, zoomLevel) {
        centerCoordinate = QtPositioning.coordinate(lat, lon)
        map.zoomLevel = zoomLevel
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: myPlugin
        center: centerCoordinate
        copyrightsVisible: false
        zoomLevel: 10.52
        activeMapType: supportedMapTypes[1]

        ComboBox {
            id: mapTypeCB
            model: ["Схема", "Спутник"]

            onCurrentIndexChanged: map.activeMapType = map.supportedMapTypes[currentIndex]
        }

        MapItemView {
            model: places
            delegate: MapQuickItem {
                coordinate: QtPositioning.coordinate(latitude, longitude)

                anchorPoint.x: image.width * 0.5
                anchorPoint.y: image.height

                sourceItem: Column {
                    Image { id: image; source: "marker.png" }
                    Text { text: name; font.bold: true }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: parentItem.parent.showPage(url)
                }
            }
        }

        focus : true
        Keys.onPressed: {
            switch (event.key) {
                case Qt.Key_Escape:
                    parentItem.parent.source = "MainPage.qml"
                    break;
            }
        }
    }
}
