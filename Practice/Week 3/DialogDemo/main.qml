import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
        text: "Open dialog"
        anchors.centerIn: parent
        onClicked: dialog.open()
    }

    Dialog {
        id : dialog
        title: "Login"

        modal: true

        contentItem: Column {
            spacing: 10
            TextField {
                id: username
            }
            Button {
                text : "Submit"
                onClicked: {
                    console.log(username.text)
                    dialog.close()
                }
            }
        }
    }
}
