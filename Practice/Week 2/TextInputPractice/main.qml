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
                border.color: nameResponse.activeFocus ? "black" : "beige"

                TextInput {
                    id: nameResponse
                    //placeholderText : "type you name here"
                    text : "type you name here"
                    anchors.centerIn: parent
                    focus: true
                    KeyNavigation.tab: passwordResponse
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
                    focus: false
                }
            }

            Rectangle {
                id : passwordResponeRect
                width: passwordResponse.implicitWidth + 20
                height: passwordResponse.implicitHeight + 20
                color: "beige"
                border.color: passwordResponse.activeFocus ? "black" : "beige"

                TextInput {
                    id: passwordResponse
                    text : "type you password here"
                    echoMode: TextInput.Password
                    anchors.centerIn: parent
                    //focus: true
                    KeyNavigation.tab: nameResponse
                }
            }
        }
    }
}
