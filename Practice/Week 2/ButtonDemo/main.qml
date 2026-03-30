import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: 20
        Button {
            id : button1
            text : "Button1"
            Layout.fillWidth: true

            onClicked: {
                console.log("clicked on button 1")
            }
            onDoubleClicked: {
                console.log("double clicked on button 1")
            }
        }
        Button {
            id : button2
            text : "Button2"
            Layout.fillWidth: true
            onClicked: {
                console.log("clicked on button 2")
            }
            onDoubleClicked: {
                console.log("double clicked on button 2F")
            }
        }
    }
}
