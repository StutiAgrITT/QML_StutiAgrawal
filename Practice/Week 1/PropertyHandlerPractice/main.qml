import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : rectId
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent
        color: crossed400 ? "purple" : crossed300 ? "blue" : crossed200 ? "green" : "red"
        property bool crossed200: false
        property bool crossed300: false
        property bool crossed400: false

        Text {
            anchors.centerIn: parent
            id : textId
            text : "Width : " + rectId.width
        }

        onWidthChanged: {
            //console.log("Width changed to: " + width)
            if (width >= 400 && !crossed400) {
                console.log("Width crossed 400")
                crossed400 = true
            }

            else if(width < 400 && crossed400) {
                crossed400 = false
            }

            if (width >= 300 && !crossed300) {
                console.log("Width crossed 300")
                crossed300 = true
            }

            else if(width < 300 && crossed300) {
                crossed300 = false
            }

            if (width >= 200 && !crossed200) {
                console.log("Width crossed 200")
                crossed200 = true
            }

            else if(width < 200 && crossed200) {
                crossed200 = false
            }
        }
    }
}
