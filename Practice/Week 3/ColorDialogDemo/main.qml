import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    ColumnLayout {
        spacing: 20
        anchors.centerIn: parent
        Button {
            text: "Select colour"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                colorDialog.open()
            }
        }

        Rectangle {
            id: box
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 200
            border {
                color: "black"
                width: 10
            }
        }
    }

    ColorDialog {
        id: colorDialog

        onAccepted: {
            console.log("colour changes to: " + color)
            box.color = color
            colorDialog.close()
        }
    }


}
