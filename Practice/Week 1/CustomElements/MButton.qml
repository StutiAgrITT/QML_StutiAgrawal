import QtQuick 2.11
Item {
    id: rootId
    property alias buttonText: buttonTextId.text
    signal buttonClicked
    width: containerId.width
    height: containerId.height
    Rectangle {
        id: containerId
        width: buttonTextId.implicitWidth + 20
        height: buttonTextId.implicitHeight + 20
        color: "pink"
        border {
            color: "black"
            width: 3
        }

        Text {
            id: buttonTextId
            text: "Button"
            anchors.centerIn: parent
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rootId.buttonClicked()
            }
        }
    }
}

