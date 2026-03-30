import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        spacing: 15
        Row {
            spacing: 10
            Rectangle {
                width: 100
                height: 40

                Text {
                    text: "Name"
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: 150
                height: 40
                color: "lightgray"

                TextInput {
                    anchors.fill: parent
                    focus: true
                }
            }
        }

        Row {
            spacing: 10
            Rectangle {
                width: 100
                height: 40

                Text {
                    text: "Password"
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                width: 150
                height: 40
                color: "lightgray"

                TextInput {
                    anchors.fill: parent
                    echoMode: TextInput.Password
                }
            }
        }
    }
}
