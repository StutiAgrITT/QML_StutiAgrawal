import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : containerId
        width: 300
        height: width
        color: "black"
        border.color: "black"
        anchors.centerIn: parent

        Grid {
            columns: 3
            spacing: 10
            //rows: 3

            Rectangle {
                id : topleft
                width: 100
                height: width
                color: "green"

                Image {
                    id: img
                    width: 50
                    height: 50
                    anchors.centerIn: parent
                    source: "images/images.jpeg"
                }
            }
            Rectangle {
                id : topCenter
                width: 100
                height: width
                color: "beige"
            }
            Rectangle {
                id : topRight
                width: 100
                height: width
                color: "dodgerblue"
            }
            Rectangle {
                id : midLeft
                width: 100
                height: width
                color: "pink"
            }
            Rectangle {
                id : midCenter
                width: 100
                height: width
                color: "red"
            }
            Rectangle {
                id : midRight
                width: 100
                height: width
                color: "yellow"
            }
            Rectangle {
                id : bottomLeft
                width: 100
                height: width
                color: "teal"
            }
            Rectangle {
                id : bottomCenter
                width: 100
                height: width
                color: "lightgreen"
            }
            Rectangle {
                id : bottomRight
                width: 100
                height: width
                color: "blue"
            }
        }

    }
}
