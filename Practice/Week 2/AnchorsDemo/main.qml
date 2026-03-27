import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Anchors demo")

    Rectangle {
        id : containerId
        width: 300
        height: width
        anchors.centerIn: parent
        border.color: "black"

        Rectangle {
            id : topleft
            width: 100
            height: width
            color: "green"
        }
        Rectangle {
            id : topCenter
            width: 100
            height: width
            color: "beige"
            anchors.left: topleft.right
        }
        Rectangle {
            id : topRight
            width: 100
            height: width
            color: "dodgerblue"
            anchors.left: topCenter.right
        }
        Rectangle {
            id : midLeft
            width: 100
            height: width
            color: "pink"
            anchors.top: topleft.bottom
        }
        Rectangle {
            id : midCenter
            width: 100
            height: width
            color: "red"
            anchors.top: topCenter.bottom
            anchors.left: midLeft.right
        }
        Rectangle {
            id : midRight
            width: 100
            height: width
            color: "yellow"
            anchors.top: topRight.bottom
            anchors.left: midCenter.right
        }
        Rectangle {
            id : bottomLeft
            width: 100
            height: width
            color: "teal"
            anchors.top: midLeft.bottom
        }
        Rectangle {
            id : bottomCenter
            width: 100
            height: width
            color: "lightgreen"
            anchors.top: midCenter.bottom
            anchors.left: bottomLeft.right
        }
        Rectangle {
            id : bottomRight
            width: 100
            height: width
            color: "blue"
            anchors.top: midRight.bottom
            anchors.left: bottomCenter.right
        }
    }

    Rectangle {
        id : blackRect
        width: 150
        height: width
        color: "black"
        anchors.right: containerId.left
        anchors.top: parent.top
    }
}
