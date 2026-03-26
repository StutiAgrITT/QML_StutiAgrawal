import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : contanerRectId
        width: parent.width
        height: 200
        color: "beige"

        Rectangle {
            id : movingRectangle
            width: 50
            height: width
            color: "red"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: function(mouse) {
                console.log(mouse.x)
                movingRectangle.x = mouse.x
                movingRectangle.y = mouse.y
            }

            onWheel: {
                console.log("X : " + wheel.x + "Y : " + wheel.y + " angleData : " + wheel.angleDelta)
            }

            hoverEnabled: true
            onHoveredChanged: {
                if (containsMouse === true) {
                    movingRectangle.color = "red"
                }
                else {
                    movingRectangle.color = "green"
                }
            }
        }
    }

    Rectangle {
        id : dragContainerId
        width: parent.width
        height: 200
        color: "beige"
        y : 250

        Rectangle {
            id : draggableRect
            width: 50
            height: width
            color: "blue"

            onXChanged: {
                console.log("X Coordinate : " + draggableRect.x)
            }

        }

        MouseArea {
            anchors.fill: parent
            drag.target: draggableRect
            drag.axis: Drag.XandYAxis
            drag.minimumX: 0
            drag.maximumX: dragContainerId.width - draggableRect.width
            drag.minimumY: 0
            drag.maximumY: dragContainerId.height - draggableRect.height
        }
    }
}
