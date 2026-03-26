import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id : pinkRectId
        width : 20
        height: 1.5 * width
        color: "pink"
    }

    Rectangle {
        id : blueRectId
        width: 100
        height: 100
        color: "lightsteelblue"
        anchors.bottom: parent.bottom

        MouseArea {
            anchors.fill: parent
            onClicked: {
                pinkRectId.width = pinkRectId.width + 20;
            }
        }
    }
    Rectangle {
        id : greenRectId
        width: 100
        height: 100
        color: "lightgreen"
        anchors.bottom: parent.bottom
        anchors.left: blueRectId.right

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //pinkRectId.height = 100; // breaks property binding as = overrides binding
                //fix:
                pinkRectId.height = Qt.binding(function(){
                    return pinkRectId.width * 2;
                })
                //pinkRectId.height = pinkRectId.width * 2; // this would also break, keeps height fixed instead of like property
            }
        }
    }


}
