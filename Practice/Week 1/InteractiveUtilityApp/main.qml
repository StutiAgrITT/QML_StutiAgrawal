import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: rect1Id
        width: 200
        height: 200
        color: "pink"
        x : 50
        y : 50

        MouseArea {
            anchors.fill: parent

            hoverEnabled: true

            onEntered: {
                parent.color = "navajowhite"
            }

            onExited: {
                parent.color = "pink"
            }

            onClicked: {
                Qt.openUrlExternally("https://google.com")
            }

            Text {
                text : "Open Google"
                anchors.centerIn: parent
            }
        }
    }

    Rectangle {
        id: rect2Id
        width: 200
        height: 200
        anchors.left: rect1Id.right
        color: "pink"
        y : rect1Id.y

        MouseArea {
            anchors.fill: parent

            hoverEnabled: true

            onEntered: {
                parent.color = "navajowhite"
            }

            onExited: {
                parent.color = "pink"
            }

            onClicked: {
                console.log(Qt.formatDateTime(new Date(), "hh:mm:sss"))
            }

            Text {
                text : "Display Time"
                anchors.centerIn: parent
            }
        }
    }

    Rectangle {
        id: rect3Id
        width: 200
        height: 200
        color: "pink"
        anchors.left : rect2Id.right
        y : rect1Id.y

        MouseArea {
            anchors.fill: parent

            hoverEnabled: true

            onEntered: {
                parent.color = "navajowhite"
            }

            onExited: {
                parent.color = "pink"
            }

            onClicked: {
                Qt.quit()
            }

            Text {
                text : "Exit"
                anchors.centerIn: parent
            }
        }
    }
}
