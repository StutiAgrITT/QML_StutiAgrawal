import QtQuick 2.12
import QtQuick.Window 2.12
import "utilities1.js" as Utilities1

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Javascript Import Demo")

    Rectangle {
        width: 300
        height: 100
        color: "blue"
        anchors.centerIn: parent

        Text {
            id: textId
            text: "click me"
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                Utilities1.greeting()
                console.log("Our ages combined : " + Utilities1.combineAges(21, 21))
                console.log("diff: " + Utilities1.subtract(5, 3))
            }
        }
    }
}
