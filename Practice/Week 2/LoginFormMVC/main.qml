import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import AppState 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ColumnLayout {
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        TextField {
            id: nameInput
            placeholderText: "Enter name"
            onTextChanged: {
                AppState.username = text
            }
        }

        TextField {
            id: passwordInput
            placeholderText: "Enter password"
            echoMode: TextInput.Password

            onAccepted: login()
            onTextChanged: {
                AppState.password = text
            }
        }

        Button {
            id: submitButton
            text: "Submit"
            background: Rectangle {
                color: submitButton.pressed ? "darkblue" : "blue"
                radius: 10
            }

            contentItem: Text {
                text : submitButton.text
                color: "white"
            }

            onClicked: login()
        }
    }

    function login() {
        console.log(AppState.username + " / " + AppState.password)
    }
}
