import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    ScrollView {
        width: 300
        height: 150
        anchors.centerIn: parent
        background: Rectangle {
            color: "white"
            border.color: textAreaId.activeFocus ? "blue" : "gray"
            border.width: 2
            radius: 8
        }
        TextArea {
            id: textAreaId
            wrapMode: TextEdit.Wrap
            placeholderText: "Enter your message..."
            padding: 10
        }
    }
}
