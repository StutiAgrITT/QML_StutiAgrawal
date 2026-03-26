import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("JS Usage Demo")

    Rectangle {
        id : containerRect
        width: getHeight()
        height: 100
        color: x > 300 ? "red" : "green" //property binding

        onXChanged: {
            console.log("Current value of x : " + x)
        }

        function getHeight() {
            return height * 2
        }
    }

    MouseArea {
        anchors.fill: parent
        drag.target: containerRect
        drag.axis: Drag.XAxis
        drag.minimumX: 0
        drag.maximumX: parent.width - containerRect.width
    }
}
