import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

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
        }

        TextField {
            id: passwordInput
            placeholderText: "Enter password"
            echoMode: TextInput.Password

            Keys.onPressed: function(event) {
                if(event.key === Qt.Key_Return) {
                    submitButton.clicked()
                }
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

            onClicked: {
                console.log("Logged in : " + nameInput.text + " / " + passwordInput.text)
            }
        }
    }

}
