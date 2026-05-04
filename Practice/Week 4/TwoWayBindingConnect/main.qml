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

    Component.onCompleted: {
        root.p1Changed.connect(function() {
            if (p1 !== p2) p2 = p1
        })
        root.p2Changed.connect(function() {
            if (p2 !== p1) p1 = p2
        })
    }


    Column {
        spacing: 10

        Row {
            spacing: 10
            Button {
                onClicked: {
                    p1 += 1
                }
            }
            Text {
                text: p1
            }
        }

        Row {
            spacing: 10
            Button {
                onClicked: {
                    p2 += 1
                }
            }
            Text {
                text: p2
            }
        }

    }
}

