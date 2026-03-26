import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("QT Syntax Demo")

    property string textToShow : ""

    Row {
        id : row1
        anchors.centerIn: parent
        spacing: 20
        Rectangle {
            id : redRectId
            width: 150
            height: 150
            color: "red"
            radius: 10
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on Red Rectangle")
                    textToShow = "red"
                }
            }
        }
        Rectangle {
            id : blueRectId
            width: 150
            height: 150
            color: "blue"
            radius: 10
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on Blue Rectangle")
                    textToShow = "blue"
                }
            }
        }
        Rectangle {
            id : greenRectId
            width: 150
            height: 150
            color: "green"
            radius: 10
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on Green Rectangle")
                    textToShow = "green"
                }
            }
        }

        Rectangle {
            id : textRectId
            width: 150
            height: 150
            color: "pink"
            radius: 150
            Text {
                id: textId
                anchors.centerIn: parent
                text: textToShow
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on Pink Circle")
                    textToShow = "Pink"
                }
            }
        }
    }



}
