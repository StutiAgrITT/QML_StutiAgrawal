import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Row {
        anchors.centerIn: parent

        Rectangle {
            id : firstRect
            width: 200
            height: width
            border.color: "black"
            color: "lightgreen"
            focus: true

            Keys.onDigit5Pressed: {
                console.log("I am rect1")
            }
            KeyNavigation.right: secondRect

            onFocusChanged: {
                if (focus === true) {
                    color = "lightgray"
                }
                else {
                    color = "lightgreen"
                }
            }
        }


        Rectangle {
            id : secondRect
            width: 200
            height: width
            border.color: "black"
            color: "lightblue"

            Keys.onDigit5Pressed: {
                console.log("I am rect2")
            }

            KeyNavigation.left: firstRect

            onFocusChanged: {
                if (focus === true) {
                    color = "lightgray"
                }
                else {
                    color = "lightblue"
                }
            }
        }
    }
}
