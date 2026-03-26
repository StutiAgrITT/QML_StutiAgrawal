import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : contaierRect
        anchors.centerIn: parent
        width: 300
        height: 50
        color: "dodgerblue"
        focus: true

        Keys.onDigit1Pressed: function(event) { // this will be fired because specific takes priority
            console.log("Pressed on Key 1")
            // write this to fire both
            event.accepted = false
        }

        Keys.onDigit5Pressed: function(event) {
            if (event.modifiers === Qt.ControlModifier) {
                console.log("Pressed Ctrl + 5")
            }
            else {
                console.log("Pressed on Key 5")
            }
            event.accepted = false
        }

        Keys.onPressed: function(event){
            if (event.key === Qt.Key_1) {
                console.log("Key 1 pressed")
            }

            if (event.key === Qt.Key_5 && event.modifiers === Qt.ControlModifier) {
                console.log("Ctrl + 5 pressed")
            }

            if (event.key === Qt.Key_5 && event.modifiers !== Qt.ControlModifier) {
                console.log(("Key 5 pressed"))
            }
        }

    }
}
