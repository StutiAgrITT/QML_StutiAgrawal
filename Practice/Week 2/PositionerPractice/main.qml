import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Row {
        spacing: 20
        anchors.centerIn: parent
        Rectangle {
            width: 80
            height: 80
            color: "red"
        }
        Rectangle {
            width: 80
            height: 80
            color: "blue"
        }
        Rectangle {
            width: 80
            height: 80
            color: "green"
        }
    }
}
