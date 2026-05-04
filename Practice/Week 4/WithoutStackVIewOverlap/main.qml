import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480

    Rectangle {
        id: page1
        anchors.fill: parent
        color: "lightblue"

        Button {
            text: "Go to page 2"
            anchors.centerIn: parent

            onClicked: {
                page2.visible = true
            }
        }

        onVisibleChanged: {
            console.log("Page1 visibility changed")
        }

    }

    Rectangle {
        id: page2
        anchors.fill: parent
        color: "lightgreen"
        visible: false

        Button {
            text: "Go to page 1"
            anchors.centerIn: parent

            onClicked: {
                page2.visible = false
            }
        }

        onVisibleChanged: {
            console.log("Page2 visibility changed")
        }
    }
}
