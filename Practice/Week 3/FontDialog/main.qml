import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("FileDialog Demo")

    Column {
        spacing: 20
        anchors.centerIn: parent

        Button{
            text : "Choose Font"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                fontDialogId.open()
            }
        }

        Text {
            id : textId
            text : "Hello World"
        }

        FontDialog{
            id : fontDialogId
            onAccepted: {
                console.log("Font chosen: " + font)
                textId.font = font
            }

            onRejected: {
                console.log("Dialog rejected")
            }
        }
    }
}
