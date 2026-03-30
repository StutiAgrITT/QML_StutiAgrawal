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
                id : nameResponseRect
                width: nameResponse.implicitWidth + 20
                height: nameResponse.implicitHeight + 20
                color: "beige"
                border.color: nameResponse.activeFocus ? "black" : "beige"

                TextInput {
                    id: nameResponse
                    //placeholderText : "type you name here"
                    anchors.centerIn: parent
                    focus: true
                    KeyNavigation.tab: passwordResponse
                    Keys.onPressed: function(event){
                        if(event.key === Qt.Key_Return) {
                            passwordResponse.forceActiveFocus()
                        }
                    }
                }

                Text {
                    text : "type you name here"
                    color: "gray"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    visible: nameResponse.text.length === 0
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
                    echoMode: TextInput.Password
                    anchors.fill: parent
                    anchors.margins: 50
                    //focus: true
                    KeyNavigation.tab: nameResponse
                    Keys.onPressed: function(event) {
                        if (event.key === Qt.Key_Return) {
                            console.log("Login : " + nameResponse.text + " / " + passwordResponse.text)
                        }
                    }
                }
                Text {
                    text : "type you password here"
                    color: "gray"
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    visible: passwordResponse.text.length === 0
                }
            }
        }
    }
}
