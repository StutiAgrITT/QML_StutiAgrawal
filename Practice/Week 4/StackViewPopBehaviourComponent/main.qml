import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: page1
    }

    Component {
        id : page1
        Rectangle {
            color: "lightblue"

            Button {
                text: "Go to page 2"
                anchors.centerIn: parent
                onClicked: stack.push(page2)
            }
        }
    }

    Component { // will get created and destroyed dynamically
        id: page2
        Rectangle {
            color: "lightgreen"

            Component.onCompleted: console.log("Page2 CREATED")
            Component.onDestruction: console.log("Page2 DESTROYED")

            Button {
                text: "Back"
                anchors.centerIn: parent
                onClicked: stack.pop() // not destroyed
            }
        }
    }

}
