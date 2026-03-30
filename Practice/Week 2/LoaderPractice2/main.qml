import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Component {
        id: redScreen
        Rectangle {
            color: "red"

            Text {
                text : "HOME"
                anchors.centerIn: parent
            }
        }
    }

    Component {
        id: blueScreen
        Rectangle {
            color: "blue"

            Text {
                text : "PROFILE"
                anchors.centerIn: parent
            }
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: redScreen
    }

    Rectangle {
        id: button
        width: 100
        height: 50
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "beige"

        Text {
            text : "Toggle"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                loader.sourceComponent = loader.sourceComponent === redScreen ? blueScreen: redScreen
            }
        }
    }
}
