import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Column {
        spacing: 10
        Row {
            Rectangle {
                id : nameLabelRect
                width: nameLabel.implicitWidth + 20
                height: nameResponse.implicitHeight + 20
                color: "beige"

                Text {
                    id: nameLabel
                    text: "Enter name: "
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id : nameResponeRect
                width: nameResponse.implicitWidth + 20
                height: nameResponse.implicitHeight + 20
                color: "beige"

                TextField {
                    id: nameResponse
                    placeholderText : "type you name here"
                    anchors.centerIn: parent
                }
            }
        }

        Row {
            Rectangle {
                id : passwordLabelRect
                width: passwordLabel.implicitWidth + 20
                height: passwordResponse.implicitHeight + 20
                color: "beige"

                Text {
                    id: passwordLabel
                    text: "Enter password: "
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id : passwordResponeRect
                width: passwordResponse.implicitWidth + 20
                height: passwordResponse.implicitHeight + 20
                color: "beige"

                TextField {
                    id: passwordResponse
                    placeholderText : "type you password here"
                    echoMode: TextInput.Password
                    anchors.centerIn: parent
                }
            }
        }
    }
}
