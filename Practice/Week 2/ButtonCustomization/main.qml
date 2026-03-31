import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
        id: myBtn
        anchors.centerIn: parent
        text: "Submit"
        background: Rectangle {
            color: myBtn.pressed ? "darkblue" : "blue"
            radius: 10
        }

        contentItem: Text {
            text: myBtn.text
            color: "white"
            anchors.centerIn: parent
        }

        onClicked: {
            console.log("Submitted")
        }
    }
}
