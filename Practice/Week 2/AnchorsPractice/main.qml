import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : box1
        height: 300
        width: 300
        //anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        color: "beige"

        Text {
            text : "TOP LEFT"
            anchors.left: parent.left
        }

        Text {
            text: "CENTER"
            anchors.centerIn: parent
        }
        Text {
            text : "BOTTOM RIGHT"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        }
    }

    Rectangle {
        id : box2
        height: 300
        width: 200
        color: "red"
        anchors.left: box1.right
        anchors.top: box1.top
        anchors.leftMargin: 10
    }
}
