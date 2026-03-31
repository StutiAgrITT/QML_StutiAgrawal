import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import App 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Button {
        id: myBtn
        text : "Submit"
        background: Rectangle {
            color: myBtn.pressed ? Theme.secondaryColor : Theme.primaryColor
            radius: Theme.buttonRadius
        }
        contentItem: Text {
            text: myBtn.text
            color: myBtn.pressed ? Theme.primaryColor : Theme.secondaryColor
        }
        onClicked: {
            console.log("submitted")
        }
    }
}
