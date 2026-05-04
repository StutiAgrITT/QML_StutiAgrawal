import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int p1: 0
    property int p2: 0

    Column {
        spacing: 10
        Row {
            spacing: 20
            Button {
                id: btn1
                onClicked: {
                    root.p1 += 1
                }
            }
            Text {
                id: text1
                text: root.p1
            }
        }
        Row {
            spacing: 20
            Button {
                id: btn2
                onClicked: {
                    root.p2 += 1
                }
            }
            Text {
                id: text2
                text: root.p2
            }
        }

    }
    onP1Changed: {
        console.log("P1 changed to : " + p1 + ", updating P2")
        if (p1 !== p2) {
            p2 += 1
        }
    }

    onP2Changed: {
        console.log("P2 changed to : " + p2 + ", updating P1")
        if (p1 !== p2) {
            p1 += 1
        }

    }
}
