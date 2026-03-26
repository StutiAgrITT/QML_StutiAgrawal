import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id : rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : rectId
        width: parent.width / 2
        height: parent.height / 2
        color: "lightcoral"
        anchors.centerIn: parent

        Text {
            text : "Area : " + rectId.width * rectId.height;
            anchors.centerIn: parent
        }

        MouseArea {
            property bool isStatic: false
            anchors.fill: parent
            onClicked: {
                if (isStatic === false) {
                    rectId.width = 300 // binding broken
                    rectId.height = 300
                    isStatic = true
                }

                else {
                    rectId.width = Qt.binding(function() {
                        return rootId.width / 2
                    })
                    rectId.height = Qt.binding(function() {
                        return rootId.height / 2
                    })
                    isStatic = false
                }
            }
        }
    }
}
