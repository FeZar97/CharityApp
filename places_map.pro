QT += quick qml network positioning quickcontrols2 location webengine
CONFIG += c++11

SOURCES = main.cpp

RESOURCES += places_map.qrc

TARGET = MapApp
TEMPLATE = app

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
