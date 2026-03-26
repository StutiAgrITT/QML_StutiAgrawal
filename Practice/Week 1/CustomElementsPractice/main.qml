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

        HoverableMouseArea {
            buttonName: "Open Google"
            onClicked: {
                Qt.openUrlExternally("https://google.com")
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

        HoverableMouseArea {
            buttonName: "Display Time"
            onClicked: {
                console.log(Qt.formatDateTime(new Date(), "hh:mm:ss"))
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

        HoverableMouseArea{
            buttonName: "Exit"
            onClicked: {
                Qt.quit()
            }
        }
    }
}
