import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Counter using property binding")
    property int count: 0

    Text {
        id : textId
        anchors.centerIn: parent
        text : count
        font.pointSize: 100
    }

    Row {
        id : rowId
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20

        Rectangle {
            id : increaseId
            height: 100
            width: 100
            color: "lightblue"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    count += 1;
                }
            }
        }

        Rectangle {
            id : decreaseId
            height: 100
            width: 100
            color: "lightgreen"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    count -= 1;
                }
            }
        }
    }
}
