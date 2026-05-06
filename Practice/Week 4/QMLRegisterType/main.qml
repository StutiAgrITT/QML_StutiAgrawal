import QtQuick 2.12
import QtQuick.Window 2.12
import SomeHeader 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    BackendClass {
        id: backend
    }

    Text {
        anchors.centerIn: parent
        text : backend.getNumber()
    }
}
